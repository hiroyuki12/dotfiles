FasdUAS 1.101.10   ��   ��    k             l    
 ����  O    
  	  I   	������
�� .miscactvnull��� ��� null��  ��   	 m      
 
�                                                                                  sprf  alis    ~  Macintosh HD               �swH+     tSystem Preferences.app                                           �M�m��        ����  	                Applications    �r��      �mS       t  1Macintosh HD:Applications: System Preferences.app   .  S y s t e m   P r e f e r e n c e s . a p p    M a c i n t o s h   H D  #Applications/System Preferences.app   / ��  ��  ��        l     ��������  ��  ��        l   � ����  O    �    O    �    Q    �     k    e       I   �� ��
�� .sysodelanull��� ��� nmbr  m    ���� ��        I   -�� ��
�� .prcsclicnull��� ��� uiel  n    )    4   & )��  
�� 
menI   m   ' ( ! ! � " "  K e y b o a r d  n    & # $ # 4   # &�� %
�� 
menE % m   $ % & & � ' '  V i e w $ 4    #�� (
�� 
mbar ( m   ! "���� ��     ) * ) l  . .��������  ��  ��   *  + , + I  . 3�� -��
�� .sysodelanull��� ��� nmbr - m   . /���� ��   ,  . / . O   4 K 0 1 0 l  A J 2 3 4 2 r   A J 5 6 5 m   A D����  6 1   D I��
�� 
valL 3   Key Repeat [Fast] max 7    4 � 7 7 0   K e y   R e p e a t   [ F a s t ]   m a x   7 1 n   4 > 8 9 8 4   ; >�� :
�� 
sliI : m   < =����  9 n   4 ; ; < ; 4   8 ;�� =
�� 
tabg = m   9 :����  < 4   4 8�� >
�� 
cwin > m   6 7 ? ? � @ @  K e y b o a r d /  A B A l  L L��������  ��  ��   B  C�� C O   L e D E D l  [ d F G H F r   [ d I J I m   [ ^����  J 1   ^ c��
�� 
valL G &   Delay Util Repeat [Short] max 6    H � K K @   D e l a y   U t i l   R e p e a t   [ S h o r t ]   m a x   6 E n   L X L M L 4   U X�� N
�� 
sliI N m   V W����  M n   L U O P O 4   R U�� Q
�� 
tabg Q m   S T����  P 4   L R�� R
�� 
cwin R m   N Q S S � T T  K e y b o a r d��    R      �� U��
�� .ascrerr ****      � **** U o      ���� 0 theerror theError��    I  m ��� V W
�� .sysodlogaskr        TEXT V l  m v X���� X b   m v Y Z Y b   m t [ \ [ m   m p ] ] � ^ ^  S o r r y . \ o   p s��
�� 
ret  Z o   t u���� 0 theerror theError��  ��   W �� _ `
�� 
btns _ m   y | a a � b b  O K ` �� c��
�� 
dflt c m    � d d � e e  O K��    4    �� f
�� 
pcap f m     g g � h h $ S y s t e m   P r e f e r e n c e s  m     i i�                                                                                  sevs  alis    �  Macintosh HD               �swH+     USystem Events.app                                               �\�'�|        ����  	                CoreServices    �r��      �'?�       U   T   S  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��  ��     j k j l  � � l���� l I  � ��� m��
�� .aevtquitnull��� ��� null m m   � � n n�                                                                                  sprf  alis    ~  Macintosh HD               �swH+     tSystem Preferences.app                                           �M�m��        ����  	                Applications    �r��      �mS       t  1Macintosh HD:Applications: System Preferences.app   .  S y s t e m   P r e f e r e n c e s . a p p    M a c i n t o s h   H D  #Applications/System Preferences.app   / ��  ��  ��  ��   k  o p o l     ��������  ��  ��   p  q r q l     �� s t��   s ( "----------------------------------    t � u u D - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - r  v w v l     ��������  ��  ��   w  x�� x l      �� y z��   y

tell application "System Preferences"	activate	set current pane to pane "com.apple.preference.keyboard"end telldo shell script "sleep 1s"-- set Key Repeat Fast, Delay Until Repeat Shorttell application "System Events"	tell application process "System Preferences" to tell tab group 0 of window "Keyboard"		click radio button "Keyboard" -- "Keyboard" or 1		set value of slider "Key Repeat" to 7 -- MAX 7		set value of slider "Delay Until Repeat" to 6 -- MAX 6		--get every UI element	end tellend tell
    z � { { 
 t e l l   a p p l i c a t i o n   " S y s t e m   P r e f e r e n c e s "  	 a c t i v a t e  	 s e t   c u r r e n t   p a n e   t o   p a n e   " c o m . a p p l e . p r e f e r e n c e . k e y b o a r d "  e n d   t e l l   d o   s h e l l   s c r i p t   " s l e e p   1 s "   - -   s e t   K e y   R e p e a t   F a s t ,   D e l a y   U n t i l   R e p e a t   S h o r t  t e l l   a p p l i c a t i o n   " S y s t e m   E v e n t s "  	 t e l l   a p p l i c a t i o n   p r o c e s s   " S y s t e m   P r e f e r e n c e s "   t o   t e l l   t a b   g r o u p   0   o f   w i n d o w   " K e y b o a r d "  	 	 c l i c k   r a d i o   b u t t o n   " K e y b o a r d "   - -   " K e y b o a r d "   o r   1  	 	 s e t   v a l u e   o f   s l i d e r   " K e y   R e p e a t "   t o   7   - -   M A X   7  	 	 s e t   v a l u e   o f   s l i d e r   " D e l a y   U n t i l   R e p e a t "   t o   6   - -   M A X   6  	 	 - - g e t   e v e r y   U I   e l e m e n t  	 e n d   t e l l  e n d   t e l l 
��       �� | }��   | ��
�� .aevtoappnull  �   � **** } �� ~����  ���
�� .aevtoappnull  �   � **** ~ k     � � �   � �   � �  j����  ��  ��    ���� 0 theerror theError �  
�� i�� g������ &�� !���� ?�������� S������ ]���� a�� d������
�� .miscactvnull��� ��� null
�� 
pcap
�� .sysodelanull��� ��� nmbr
�� 
mbar
�� 
menE
�� 
menI
�� .prcsclicnull��� ��� uiel
�� 
cwin
�� 
tabg
�� 
sliI�� 
�� 
valL�� �� 0 theerror theError��  
�� 
ret 
�� 
btns
�� 
dflt�� 
�� .sysodlogaskr        TEXT
�� .aevtquitnull��� ��� null�� �� *j UO� |*��/ t Qkj O*�k/��/��/j Okj O*��/�k/�l/ a *a ,FUO*�a /�k/�k/ a *a ,FUW "X  a _ %�%a a a a a  UUO�j  ascr  ��ޭ