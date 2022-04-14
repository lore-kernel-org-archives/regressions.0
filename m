Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE2D7A
	for <regressions@lists.linux.dev>; Thu, 14 Apr 2022 15:15:08 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id g22so1806898uam.12
        for <regressions@lists.linux.dev>; Thu, 14 Apr 2022 08:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xsfWM4G6lJ47OgzzsAWqz0TMiIQS5ThgMRWtFV6JhSc=;
        b=V5rsOhwKokGcnxlv+vmHolAqRSapQwPFALw5naYaqyP1mJmYWkqsi/NiQVYUtVfPb9
         gx89vTEdtTj8XihBS31Ldbx5iQlAwvM9QFCHPO9k1xs7ztVR8lmTy6RUFqM8bxTG1FxG
         LbPDSGVO8L242Ffyvqx/1Rd5ZcvtQsC9/kyBzVkn+DydrfS/tU+tECi549U5yxp/t4U6
         EWteR2XD+vdK7RegCJwv7DVYH35SEhq1I4HoVXMUMkmKi3kfO4x+M2/CnEZj6sZEboOr
         dkYsoH3goL82rvalQL/nd8saAql2DLdVv5OJRbC8tBRGLXZvow+1Mp/lwzF3WPILQNuT
         Nu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xsfWM4G6lJ47OgzzsAWqz0TMiIQS5ThgMRWtFV6JhSc=;
        b=s772MbrvUOMCLhEzqnBjLEnfd7zdpgA28mSWliU+yuToXFHBc165319HrT3NMCAvsG
         wRH+oyc1otJxTG988fs5xRwV6ClzQ44w8pnw4CzJuffHiJD+d47RRG3PyfI5lxE7Wffn
         HhENPLnGxFUs2Lb7w6FXBAS5/rYysrB4vwU57L8o5ZRN2kzOy+b5gV+DGISfgMUVj8SI
         tqbl3+raYOFpzFa38eJaDOyb+7vEIsuOi/Wx2ou2F6OzbMzRyqlOWiS2JgmNFr78ljQa
         X9/4a+WHYGGkIZuJCK5UZUvbZDTSgWrtqU7ajYItj2zvRhmtGZchOH1yCF8JDvQf+8hf
         2fCQ==
X-Gm-Message-State: AOAM532mYFwAcBDDDW0tJMTA0KMqQEFOaTxxUt5id+1jtgm4uprGd5ff
	2vJMgOWLlqqtxMc7xLrz71a7c6/R/n0HbIuoYfmoLsg/
X-Google-Smtp-Source: ABdhPJz5tCRFKRp/1SkUz50psBCJD/H0DxBzRZPb97NpQxn9wPgk6hqsz9Y06Bfnfd3W6YDII2rCrJWhYUy2URnzWho=
X-Received: by 2002:ab0:6f8f:0:b0:35d:5045:46c4 with SMTP id
 f15-20020ab06f8f000000b0035d504546c4mr945442uav.116.1649949307018; Thu, 14
 Apr 2022 08:15:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFrh3J9soC36+BVuwHB=g9z_KB5Og2+p2_W+BBoBOZveErz14w@mail.gmail.com>
 <CAFrh3J-xXK1ScRT2BddWzYw9VbeUsGT9cL30bC_KwhQn4G3dtQ@mail.gmail.com>
 <CAFrh3J8+Yb9gHoCaxMPCTyzzS68v9Fz9VGggkjm2hOB07Hj0Yw@mail.gmail.com>
 <CAFrh3J_GSfsXkT5A773E0Raem+h4FsN-KOdXK+qC7LUr6dUmpQ@mail.gmail.com>
 <472a1fec-ef7b-a8e2-6c14-cc5fa97bd8b3@leemhuis.info> <CAH2r5mvn7=Vt3tv6whjNDqnmpQDnmVFPppZux9ZfvyVA0rNJvg@mail.gmail.com>
 <CAN05THQvLyo-rQ9HOnWZQ2KHJCZcj171T_-BG=z4kahamLX_ZA@mail.gmail.com>
 <CAH2r5ms7XCTnCdW26Zh_ekXqk2bzqm7QxyYRLCDUPrAadqtyTA@mail.gmail.com>
 <CAN05THSctgGb63eHYJtZ__ZuoZ6fo8h7foUZROiPWDPVxZ=Ygg@mail.gmail.com>
 <CAFrh3J8pN8gG7s46dqn9yrA9HyGZ7LrZQ_ZO=B9O1xmSm8GiYw@mail.gmail.com>
 <CAFrh3J85Lrf9D=_GKb1U0t2+_z5UQ42qC+wTtvWKHbYv+_f2Zg@mail.gmail.com>
 <CANT5p=qtEABmzh3nLNbt-NZBUXA288-JHwCq7ZYozs0Do2_51w@mail.gmail.com>
 <CAFrh3J_YJhuTaBcc6durukdHsxQ1HDxRuer0kdD+t3hNvr4YDA@mail.gmail.com>
 <CANT5p=rgz95=wDnZ_ANCaQQbZ1NpW2+SE2Dm2XoSk7-dCy0g=g@mail.gmail.com>
 <64c4c945-1ac8-a623-ed5c-1f7438b1c37c@leemhuis.info> <CAFrh3J8u=iLQMPq6oTqgbLdrsZnMR8V5cmGKuiRoMey_Ch942g@mail.gmail.com>
 <CANT5p=rNqC+BO0yhSh+RK1x8rbVUSxRyeB3GJEpshhggx_n_iQ@mail.gmail.com>
In-Reply-To: <CANT5p=rNqC+BO0yhSh+RK1x8rbVUSxRyeB3GJEpshhggx_n_iQ@mail.gmail.com>
From: Satadru Pramanik <satadru@gmail.com>
Date: Thu, 14 Apr 2022 11:14:55 -0400
Message-ID: <CAFrh3J8nNfbxS86bHa7bsSo5eT3nD=jALTCVQcyqCepGQYYGaQ@mail.gmail.com>
Subject: Re: Failure to access cifs mount of samba share after resume from
 sleep with 5.17-rc5
To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, ronnie sahlberg <ronniesahlberg@gmail.com>, 
	Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>, 
	regressions@lists.linux.dev
Content-Type: multipart/mixed; boundary="00000000000057e06705dc9ec266"

--00000000000057e06705dc9ec266
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FYI I can not switch on cifsFYI before doing the initial mount.

I get this error:
echo 7 > /proc/fs/cifs/cifsFYI
bash: /proc/fs/cifs/cifsFYI: No such file or directory

So I mounted, enabled cifsFYI, unmounted, remounted the cifs volume
manually, put the laptop to sleep, rebooted the server, and then got
the error.

The dmesg is attached.

Regards,
Satadru

On Wed, Apr 13, 2022 at 11:48 PM Shyam Prasad N <nspmangalore@gmail.com> wr=
ote:
>
> Hi Satadru,
>
> Can you please send the full cifsFYI logs with manual mount? Please
> switch on cifsFYI before you mount the share.
>
> On Tue, Apr 12, 2022 at 1:40 AM Satadru Pramanik <satadru@gmail.com> wrot=
e:
> >
> > Both tests resulted in similar failures (removing the mount from fstab =
and switching the mount to an IP address vs a hostname.)
> >
> > I'll compile 5.18-rc2 and see if I have the same issues.
> >
> > On Mon, Apr 11, 2022 at 6:29 AM Thorsten Leemhuis <regressions@leemhuis=
.info> wrote:
> >>
> >> Hi, this is your Linux kernel regression tracker. Top-posting for once=
,
> >> to make this easily accessible to everyone.
> >>
> >> What's the status here?
> >>
> >> Satadru, did you do the tests?
> >>
> >> Shyam: or where you or somebody else able to address this aleady?
> >>
> >> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' ha=
t)
> >>
> >> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
> >> reports on my table. I can only look briefly into most of them and lac=
k
> >> knowledge about most of the areas they concern. I thus unfortunately
> >> will sometimes get things wrong or miss something important. I hope
> >> that's not the case here; if you think it is, don't hesitate to tell m=
e
> >> in a public reply, it's in everyone's interest to set the public recor=
d
> >> straight.
> >>
> >> #regzbot poke
> >>
> >> On 18.03.22 15:05, Shyam Prasad N wrote:
> >> > Thanks for the update. No worries.
> >> >
> >> > On Fri, Mar 18, 2022 at 7:30 PM Satadru Pramanik <satadru@gmail.com>=
 wrote:
> >> >>
> >> >> I can do those tests on March 27th when I return to my setup in NY.=
 The hostname "cheekon" is indeed resolved either locally to a RFC1918 addr=
ess via the LAN DNS server or to an IPv6 address via other DNS servers, ass=
uming the host has picked up the domain search suffix via DHCP. The laptop =
is running the stock Ubuntu 22.04 DNS resolution setup, which I believe is =
systemd-resolved.
> >> >>
> >> >> I apologize for being unable to help troubleshoot this issue again =
before I get back, as I am on a trip with family, and did not lug the Ubunt=
u laptop (and server) with me.
> >> >>
> >> >> Regards,
> >> >> Satadru
> >> >>
> >> >> On Fri, Mar 18, 2022, 4:05 AM Shyam Prasad N <nspmangalore@gmail.co=
m> wrote:
> >> >>>
> >> >>> Hi Satadru,
> >> >>>
> >> >>> For the sleep/resume issue:
> >> >>> After going through the logs in detail, I could see that cifs.ko i=
s
> >> >>> mostly behaving the way it should be. I could see that a reconnect=
 was
> >> >>> triggered, and that also worked fine for the most part.
> >> >>> The only issue is that the superblock is missing. I'm trying to
> >> >>> understand what led to that.
> >> >>>
> >> >>> You mentioned that you have the mount setup as an fstab entry. If =
it
> >> >>> is possible, can you repeat the same experiment with this entry
> >> >>> removed from fstab.
> >> >>> Also as another experiment, can you replace the hostname (cheekon)
> >> >>> with the corresponding IP address and repeat the same experiment. =
(I
> >> >>> could see "failed to resolve hostname" logs from some of your earl=
ier
> >> >>> logs after resume).
> >> >>>
> >> >>> I have a feeling that one of these two factors is exposing this bu=
g in cifs.ko.
> >> >>>
> >> >>> For the samba server restart issue, I could see from the logs that=
 you
> >> >>> pasted that your I/O process was pending a signal. This was the re=
ason
> >> >>> that the I/O kept returning errno 512 (ERESTARTSYS).
> >> >>>
> >> >>> Hi Thorsten,
> >> >>> Based on my investigations above, I believe that the way Satadru's
> >> >>> laptop is setup has exposed a bug that we're finding it hard to
> >> >>> reproduce.
> >> >>> I think that the above experiments that I suggested will help narr=
ow
> >> >>> down the problem and take us closer to root causing the issue.
> >> >>>
> >> >>> Regards,
> >> >>> Shyam
> >> >>>
> >> >>> On Wed, Mar 16, 2022 at 10:57 PM Satadru Pramanik <satadru@gmail.c=
om> wrote:
> >> >>>>
> >> >>>> I am unable to mount a cifs volume with that patch reversed.
> >> >>>> This is what dmesg shows:
> >> >>>> [  242.560881] INFO: task mount.smb3:3219 blocked for more than 1=
20 seconds.
> >> >>>> [  242.560901]       Tainted: P           OE
> >> >>>> 5.17.0-051700rc8-generic #202203132130
> >> >>>> [  242.560904] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> >> >>>> disables this message.
> >> >>>> [  242.560907] task:mount.smb3      state:D stack:    0 pid: 3219
> >> >>>> ppid:     1 flags:0x00004006
> >> >>>> [  242.560914] Call Trace:
> >> >>>> [  242.560918]  <TASK>
> >> >>>> [  242.560927]  __schedule+0x240/0x5a0
> >> >>>> [  242.560939]  schedule+0x55/0xd0
> >> >>>> [  242.560941]  schedule_preempt_disabled+0x15/0x20
> >> >>>> [  242.560944]  __mutex_lock.constprop.0+0x2e0/0x4b0
> >> >>>> [  242.560949]  __mutex_lock_slowpath+0x13/0x20
> >> >>>> [  242.560953]  mutex_lock+0x34/0x40
> >> >>>> [  242.560958]  cifs_get_smb_ses+0x367/0xab0 [cifs]
> >> >>>> [  242.561108]  ? __queue_delayed_work+0x5c/0x90
> >> >>>> [  242.561120]  mount_get_conns+0x63/0x430 [cifs]
> >> >>>> [  242.561182]  cifs_mount+0x86/0x420 [cifs]
> >> >>>> [  242.561222]  cifs_smb3_do_mount+0x10d/0x320 [cifs]
> >> >>>> [  242.561252]  ? cifs_smb3_do_mount+0x10d/0x320 [cifs]
> >> >>>> [  242.561283]  ? vfs_parse_fs_string+0x7f/0xb0
> >> >>>> [  242.561290]  smb3_get_tree+0x3e/0x70 [cifs]
> >> >>>> [  242.561337]  vfs_get_tree+0x27/0xc0
> >> >>>> [  242.561343]  do_new_mount+0x14b/0x1a0
> >> >>>> [  242.561348]  path_mount+0x1d4/0x530
> >> >>>> [  242.561350]  ? putname+0x55/0x60
> >> >>>> [  242.561357]  __x64_sys_mount+0x108/0x140
> >> >>>> [  242.561360]  do_syscall_64+0x59/0xc0
> >> >>>> [  242.561368]  ? do_syscall_64+0x69/0xc0
> >> >>>> [  242.561372]  ? handle_mm_fault+0xba/0x290
> >> >>>> [  242.561376]  ? do_user_addr_fault+0x1dd/0x670
> >> >>>> [  242.561382]  ? syscall_exit_to_user_mode+0x27/0x50
> >> >>>> [  242.561385]  ? exit_to_user_mode_prepare+0x37/0xb0
> >> >>>> [  242.561392]  ? irqentry_exit_to_user_mode+0x9/0x20
> >> >>>> [  242.561394]  ? irqentry_exit+0x33/0x40
> >> >>>> [  242.561397]  ? exc_page_fault+0x89/0x180
> >> >>>> [  242.561399]  ? asm_exc_page_fault+0x8/0x30
> >> >>>> [  242.561405]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> >> >>>> [  242.561409] RIP: 0033:0x7f42af11ceae
> >> >>>> [  242.561414] RSP: 002b:00007fff6af66c48 EFLAGS: 00000206 ORIG_R=
AX:
> >> >>>> 00000000000000a5
> >> >>>> [  242.561418] RAX: ffffffffffffffda RBX: 000055dcbe40beb0 RCX: 0=
0007f42af11ceae
> >> >>>> [  242.561420] RDX: 000055dcbe1a447e RSI: 000055dcbe1a44da RDI: 0=
0007fff6af67ea6
> >> >>>> [  242.561421] RBP: 0000000000000000 R08: 000055dcbe40beb0 R09: 0=
00055dcbe40cf40
> >> >>>> [  242.561423] R10: 0000000000000000 R11: 0000000000000206 R12: 0=
0007fff6af67e9b
> >> >>>> [  242.561424] R13: 00007f42af237000 R14: 00007f42af23990f R15: 0=
00055dcbe40cf40
> >> >>>> [  242.561427]  </TASK>
> >> >>>>
> >> >>>> On Wed, Mar 16, 2022 at 9:22 AM Satadru Pramanik <satadru@gmail.c=
om> wrote:
> >> >>>>>
> >> >>>>> I will try that.
> >> >>>>>
> >> >>>>> On Wed, Mar 16, 2022 at 1:27 AM ronnie sahlberg
> >> >>>>> <ronniesahlberg@gmail.com> wrote:
> >> >>>>>>
> >> >>>>>> I have analyzed the patch Steve bisected and we have figured ou=
t why
> >> >>>>>> it breaks multiuser mounts.
> >> >>>>>> (It basically assumes there is a 1-to-1 correlation between two
> >> >>>>>> structures in the kernel while for multiuser it is actually a 1=
-n and
> >> >>>>>> we tracked important state information for 'n' in the '1' struc=
ture
> >> >>>>>> :-( )
> >> >>>>>>
> >> >>>>>> But now that we understand how that patch broke multiuser I am =
not
> >> >>>>>> certain it is also responsible for breaking suspend.
> >> >>>>>> Satadru, can you try to compile a kernel without this patch and=
 see if
> >> >>>>>> it fixes your issue?
> >> >>>>>>
> >> >>>>>> On Wed, Mar 16, 2022 at 12:25 PM Steve French <smfrench@gmail.c=
om> wrote:
> >> >>>>>>>
> >> >>>>>>> Fix shouldn't be hard but agree with Ronnie's points about add=
ing those tests to the buildbot
> >> >>>>>>>
> >> >>>>>>> On Tue, Mar 15, 2022, 21:15 ronnie sahlberg <ronniesahlberg@gm=
ail.com> wrote:
> >> >>>>>>>>
> >> >>>>>>>> I can confirm that patch is what broke multiuser mounts too.
> >> >>>>>>>> Now the question is why the buildbot did not catch this.  I r=
emember
> >> >>>>>>>> adding a test that basic multiuser worked long time ago.
> >> >>>>>>>>
> >> >>>>>>>> I would suggest, once the code is fixed or reverted,
> >> >>>>>>>> We need someone to look at why the buildbot did not detect th=
at
> >> >>>>>>>> multiuser was broken.
> >> >>>>>>>> We should also add tests in buildbot for a simple suspend/res=
ume cycle
> >> >>>>>>>> which should be possible to do using simple virsh commands.
> >> >>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>> On Wed, Mar 16, 2022 at 8:47 AM Steve French <smfrench@gmail.=
com> wrote:
> >> >>>>>>>>>
> >> >>>>>>>>> We have bisected a regression (may be related) that was repr=
oducible
> >> >>>>>>>>> (we had difficulty reproducing Satadru's scenario) and affec=
ts a
> >> >>>>>>>>> similar area so are focused on that.  We bisected that regre=
ssion down
> >> >>>>>>>>> to this commit added early in 5.17-rc. Adding Ronnie on cc b=
ecause he
> >> >>>>>>>>> had noticed the easier to repro scenario. Still debugging.
> >> >>>>>>>>>
> >> >>>>>>>>> commit 73f9bfbe3d818bb52266d5c9f3ba57d97842ffe7 (HEAD -> tmp=
)
> >> >>>>>>>>> Author: Shyam Prasad N <sprasad@microsoft.com>
> >> >>>>>>>>> Date:   Mon Jul 19 17:37:52 2021 +0000
> >> >>>>>>>>>
> >> >>>>>>>>>     cifs: maintain a state machine for tcp/smb/tcon sessions
> >> >>>>>>>>>
> >> >>>>>>>>>     If functions like cifs_negotiate_protocol, cifs_setup_se=
ssion,
> >> >>>>>>>>>     cifs_tree_connect are called in parallel on different ch=
annels,
> >> >>>>>>>>>     each of these will be execute the requests. This maybe u=
nnecessary
> >> >>>>>>>>>     in some cases, and only the first caller may need to do =
the work.
> >> >>>>>>>>>
> >> >>>>>>>>>     This is achieved by having more states for the tcp/smb/t=
con session
> >> >>>>>>>>>     status fields. And tracking the state of reconnection ba=
sed on the
> >> >>>>>>>>>     state machine.
> >> >>>>>>>>>
> >> >>>>>>>>>     For example:
> >> >>>>>>>>>     for tcp connections:
> >> >>>>>>>>>     CifsNew/CifsNeedReconnect ->
> >> >>>>>>>>>       CifsNeedNegotiate ->
> >> >>>>>>>>>         CifsInNegotiate ->
> >> >>>>>>>>>           CifsNeedSessSetup ->
> >> >>>>>>>>>             CifsInSessSetup ->
> >> >>>>>>>>>               CifsGood
> >> >>>>>>>>>
> >> >>>>>>>>>     for smb sessions:
> >> >>>>>>>>>     CifsNew/CifsNeedReconnect ->
> >> >>>>>>>>>       CifsGood
> >> >>>>>>>>>
> >> >>>>>>>>> On Tue, Mar 15, 2022 at 8:26 AM Thorsten Leemhuis
> >> >>>>>>>>> <regressions@leemhuis.info> wrote:
> >> >>>>>>>>>>
> >> >>>>>>>>>> Hi, this is your Linux kernel regression tracker. Top-posti=
ng for once,
> >> >>>>>>>>>> to make this easily accessible to everyone.
> >> >>>>>>>>>>
> >> >>>>>>>>>> Steve, Shyam, what's up here? Satadru prodided lot's of dat=
a already
> >> >>>>>>>>>> last week and wrote below message 24h ago, but I haven't se=
en anything
> >> >>>>>>>>>> about this from your side for more than ten days now. Or is=
 the issue
> >> >>>>>>>>>> (or even a fix?) discussed somewhere else and I just missed=
 it?
> >> >>>>>>>>>>
> >> >>>>>>>>>> Just asking, because thx to rc8 there is still a chance to =
get this
> >> >>>>>>>>>> fixed before the final release happens.
> >> >>>>>>>>>>
> >> >>>>>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression =
tracker' hat)
> >> >>>>>>>>>>
> >> >>>>>>>>>> P.S.: As the Linux kernel's regression tracker I'm getting =
a lot of
> >> >>>>>>>>>> reports on my table. I can only look briefly into most of t=
hem and lack
> >> >>>>>>>>>> knowledge about most of the areas they concern. I thus unfo=
rtunately
> >> >>>>>>>>>> will sometimes get things wrong or miss something important=
. I hope
> >> >>>>>>>>>> that's not the case here; if you think it is, don't hesitat=
e to tell me
> >> >>>>>>>>>> in a public reply, it's in everyone's interest to set the p=
ublic record
> >> >>>>>>>>>> straight.
> >> >>>>>>>>>>
> >> >>>>>>>>>> On 14.03.22 14:00, Satadru Pramanik wrote:
> >> >>>>>>>>>>> This still appears to be an issue in 5.17-rc8.
> >> >>>>>>>>>>>
> >> >>>>>>>>>>> I would also not this issue appears when the samba server =
reboots. The
> >> >>>>>>>>>>> client has an unresponsive cifs mount instead of attemptin=
g to retry
> >> >>>>>>>>>>> the connection.
> >> >>>>>>>>>>>
> >> >>>>>>>>>>> dmesg after resume from suspend on 5.17-rc8:
> >> >>>>>>>>>>>
> >> >>>>>>>>>>> [ 4072.503603] PM: suspend exit
> >> >>>>>>>>>>> [ 4076.381594] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link=
 becomes ready
> >> >>>>>>>>>>> [ 4090.501947] CIFS: fs/cifs/inode.c: VFS: in
> >> >>>>>>>>>>> cifs_revalidate_dentry_attr as Xid: 633 with uid: 0
> >> >>>>>>>>>>> [ 4090.501966] CIFS: fs/cifs/inode.c: Update attributes: \=
bin inode
> >> >>>>>>>>>>> 0x00000000b30e5246 count 1 dentry: 0x0000000080235318 d_ti=
me
> >> >>>>>>>>>>> 4295826505 jiffies 4295914933
> >> >>>>>>>>>>> [ 4090.502012] CIFS: fs/cifs/transport.c: wait_for_free_cr=
edits:
> >> >>>>>>>>>>> remove 3 credits total=3D3005
> >> >>>>>>>>>>> [ 4090.502053] CIFS: fs/cifs/smb2ops.c: Encrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4090.502081] CIFS: fs/cifs/transport.c: Sending smb: smb=
_len=3D400
> >> >>>>>>>>>>> [ 4096.800754] CIFS: fs/cifs/cifsfs.c: VFS: in cifs_statfs=
 as Xid: 634
> >> >>>>>>>>>>> with uid: 1000
> >> >>>>>>>>>>> [ 4096.800783] CIFS: fs/cifs/transport.c: wait_for_free_cr=
edits:
> >> >>>>>>>>>>> remove 3 credits total=3D3002
> >> >>>>>>>>>>> [ 4096.800822] CIFS: fs/cifs/smb2ops.c: Encrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4096.800845] CIFS: fs/cifs/transport.c: Sending smb: smb=
_len=3D400
> >> >>>>>>>>>>> [ 4099.320129] CIFS: fs/cifs/dir.c: VFS: in cifs_lookup as=
 Xid: 635
> >> >>>>>>>>>>> with uid: 1000
> >> >>>>>>>>>>> [ 4099.320137] CIFS: fs/cifs/dir.c: parent inode =3D 0x000=
00000cc8fcd81
> >> >>>>>>>>>>> name is: bashprompt.sh and dentry =3D 0x000000007afa4336
> >> >>>>>>>>>>> [ 4099.320143] CIFS: fs/cifs/dir.c: NULL inode in lookup
> >> >>>>>>>>>>> [ 4099.320145] CIFS: fs/cifs/dir.c: Full path: \bashprompt=
.sh inode =3D
> >> >>>>>>>>>>> 0x0000000000000000
> >> >>>>>>>>>>> [ 4099.320164] CIFS: fs/cifs/transport.c: wait_for_free_cr=
edits:
> >> >>>>>>>>>>> remove 3 credits total=3D2999
> >> >>>>>>>>>>> [ 4099.320185] CIFS: fs/cifs/smb2ops.c: Encrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4099.320193] CIFS: fs/cifs/transport.c: Sending smb: smb=
_len=3D424
> >> >>>>>>>>>>> [ 4105.135867] CIFS: fs/cifs/smb2pdu.c: In echo request fo=
r conn_id 4
> >> >>>>>>>>>>> [ 4105.135891] CIFS: fs/cifs/transport.c: wait_for_free_cr=
edits:
> >> >>>>>>>>>>> remove 1 credits total=3D0
> >> >>>>>>>>>>> [ 4105.135921] CIFS: fs/cifs/transport.c: Sending smb: smb=
_len=3D72
> >> >>>>>>>>>>> [ 4166.576112] CIFS: fs/cifs/smb2pdu.c: In echo request fo=
r conn_id 4
> >> >>>>>>>>>>> [ 4166.576131] CIFS: fs/cifs/smb2pdu.c: Echo request faile=
d: -11
> >> >>>>>>>>>>> [ 4166.576138] CIFS: fs/cifs/connect.c: Unable to send ech=
o request to
> >> >>>>>>>>>>> server: cheekon
> >> >>>>>>>>>>> [ 4204.895155] CIFS: fs/cifs/inode.c: VFS: in
> >> >>>>>>>>>>> cifs_revalidate_dentry_attr as Xid: 636 with uid: 1000
> >> >>>>>>>>>>> [ 4204.895165] CIFS: fs/cifs/inode.c: Update attributes:  =
inode
> >> >>>>>>>>>>> 0x00000000cc8fcd81 count 2 dentry: 0x000000002b8e3e8b d_ti=
me 0 jiffies
> >> >>>>>>>>>>> 4295943531
> >> >>>>>>>>>>> [ 4204.895186] CIFS: fs/cifs/transport.c: wait_for_free_cr=
edits:
> >> >>>>>>>>>>> remove 3 credits total=3D2996
> >> >>>>>>>>>>> [ 4204.895210] CIFS: fs/cifs/smb2ops.c: Encrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4204.895221] CIFS: fs/cifs/transport.c: Sending smb: smb=
_len=3D400
> >> >>>>>>>>>>> [ 4205.757794] CIFS: fs/cifs/transport.c: \\cheekon Cancel=
ling wait
> >> >>>>>>>>>>> for mid 321 cmd: 5
> >> >>>>>>>>>>> [ 4205.757811] CIFS: fs/cifs/transport.c: \\cheekon Cancel=
ling wait
> >> >>>>>>>>>>> for mid 322 cmd: 16
> >> >>>>>>>>>>> [ 4205.757816] CIFS: fs/cifs/transport.c: \\cheekon Cancel=
ling wait
> >> >>>>>>>>>>> for mid 323 cmd: 6
> >> >>>>>>>>>>> [ 4205.757832] CIFS: fs/cifs/inode.c: cifs_get_inode_info:=
 unhandled err rc -512
> >> >>>>>>>>>>> [ 4205.757840] CIFS: fs/cifs/inode.c: VFS: leaving
> >> >>>>>>>>>>> cifs_revalidate_dentry_attr (xid =3D 636) rc =3D -512
> >> >>>>>>>>>>>
> >> >>>>>>>>>>>
> >> >>>>>>>>>>> Also including a manual unmount and remount:
> >> >>>>>>>>>>>
> >> >>>>>>>>>>> [ 4205.757840] CIFS: fs/cifs/inode.c: VFS: leaving
> >> >>>>>>>>>>> cifs_revalidate_dentry_attr (xid =3D 636) rc =3D -512
> >> >>>>>>>>>>> [ 4220.854276] CIFS: VFS: \\cheekon has not responded in 1=
80 seconds.
> >> >>>>>>>>>>> Reconnecting...
> >> >>>>>>>>>>> [ 4220.854284] CIFS: fs/cifs/connect.c: Mark tcp session a=
s need reconnect
> >> >>>>>>>>>>> [ 4220.854287] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> cifs_mark_tcp_ses_conns_for_reconnect: marking necessary s=
essions and
> >> >>>>>>>>>>> tcons for reconnect
> >> >>>>>>>>>>> [ 4220.854289] CIFS: fs/cifs/sess.c: Set reconnect bitmask=
 for chan 0; now 0x1
> >> >>>>>>>>>>> [ 4220.854292] CIFS: fs/cifs/connect.c: cifs_abort_connect=
ion: tearing
> >> >>>>>>>>>>> down socket
> >> >>>>>>>>>>> [ 4220.854293] CIFS: fs/cifs/connect.c: State: 0x3 Flags: =
0x0
> >> >>>>>>>>>>> [ 4220.854371] CIFS: fs/cifs/connect.c: Post shutdown stat=
e: 0x3 Flags: 0x0
> >> >>>>>>>>>>> [ 4220.854378] CIFS: fs/cifs/connect.c: cifs_abort_connect=
ion: moving
> >> >>>>>>>>>>> mids to private list
> >> >>>>>>>>>>> [ 4220.854380] CIFS: fs/cifs/connect.c: cifs_abort_connect=
ion: issuing
> >> >>>>>>>>>>> mid callbacks
> >> >>>>>>>>>>> [ 4220.854383] cifs_small_buf_release: 1 callbacks suppres=
sed
> >> >>>>>>>>>>> [ 4220.854384] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4220.854387] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4220.854388] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4220.854397] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4220.854412] CIFS: fs/cifs/dns_resolve.c:
> >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is who=
le unc:
> >> >>>>>>>>>>> \\cheekon
> >> >>>>>>>>>>> [ 4220.854425] CIFS: fs/cifs/transport.c: cifs_sync_mid_re=
sult: cmd=3D5
> >> >>>>>>>>>>> mid=3D317 state=3D8
> >> >>>>>>>>>>> [ 4220.854431] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4220.854431] CIFS: fs/cifs/transport.c: cifs_sync_mid_re=
sult: cmd=3D5
> >> >>>>>>>>>>> mid=3D314 state=3D8
> >> >>>>>>>>>>> [ 4220.854433] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4220.854437] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4220.854439] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4220.854442] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4220.854444] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4220.854451] CIFS: fs/cifs/inode.c: cifs_get_inode_info:=
 unhandled err rc -11
> >> >>>>>>>>>>> [ 4220.854450] CIFS: fs/cifs/cifsfs.c: VFS: leaving cifs_s=
tatfs (xid =3D
> >> >>>>>>>>>>> 634) rc =3D -11
> >> >>>>>>>>>>> [ 4220.854451] CIFS: fs/cifs/inode.c: cifs_get_inode_info:=
 unhandled err rc -11
> >> >>>>>>>>>>> [ 4220.854463] CIFS: fs/cifs/smb2pdu.c: smb2_reconnect: ab=
orting
> >> >>>>>>>>>>> reconnect due to a received signal by the process
> >> >>>>>>>>>>> [ 4220.854463] CIFS: fs/cifs/inode.c: cifs_get_inode_info:=
 unhandled err rc -512
> >> >>>>>>>>>>> [ 4220.854466] CIFS: fs/cifs/inode.c: cifs_get_inode_info:=
 unhandled err rc -512
> >> >>>>>>>>>>> [ 4220.854467] CIFS: fs/cifs/inode.c: VFS: leaving
> >> >>>>>>>>>>> cifs_revalidate_dentry_attr (xid =3D 633) rc =3D -512
> >> >>>>>>>>>>> [ 4220.854468] CIFS: fs/cifs/dir.c: Unexpected lookup erro=
r -512
> >> >>>>>>>>>>> [ 4220.854470] CIFS: fs/cifs/dir.c: cifs_revalidate_dentry=
 failed with rc=3D-512
> >> >>>>>>>>>>> [ 4220.854470] CIFS: fs/cifs/dir.c: VFS: leaving cifs_look=
up (xid =3D
> >> >>>>>>>>>>> 635) rc =3D -512
> >> >>>>>>>>>>> [ 4220.854490] CIFS: fs/cifs/dir.c: VFS: in cifs_lookup as=
 Xid: 637
> >> >>>>>>>>>>> with uid: 1000
> >> >>>>>>>>>>> [ 4220.854493] CIFS: fs/cifs/dir.c: parent inode =3D 0x000=
00000cc8fcd81
> >> >>>>>>>>>>> name is: bashprompt.sh and dentry =3D 0x00000000afae7ba3
> >> >>>>>>>>>>> [ 4220.854498] CIFS: fs/cifs/dir.c: NULL inode in lookup
> >> >>>>>>>>>>> [ 4220.854499] CIFS: fs/cifs/dir.c: Full path: \bashprompt=
.sh inode =3D
> >> >>>>>>>>>>> 0x0000000000000000
> >> >>>>>>>>>>> [ 4220.854508] CIFS: fs/cifs/smb2pdu.c: smb2_reconnect: ab=
orting
> >> >>>>>>>>>>> reconnect due to a received signal by the process
> >> >>>>>>>>>>> [ 4220.854511] CIFS: fs/cifs/inode.c: cifs_get_inode_info:=
 unhandled err rc -512
> >> >>>>>>>>>>> [ 4220.854513] CIFS: fs/cifs/dir.c: Unexpected lookup erro=
r -512
> >> >>>>>>>>>>> [ 4220.854514] CIFS: fs/cifs/dir.c: VFS: leaving cifs_look=
up (xid =3D
> >> >>>>>>>>>>> 637) rc =3D -512
> >> >>>>>>>>>>> [ 4220.854523] CIFS: fs/cifs/dir.c: VFS: in cifs_lookup as=
 Xid: 638
> >> >>>>>>>>>>> with uid: 1000
> >> >>>>>>>>>>> [ 4220.854529] CIFS: fs/cifs/dir.c: parent inode =3D 0x000=
00000cc8fcd81
> >> >>>>>>>>>>> name is: bashprompt.sh and dentry =3D 0x00000000fe692902
> >> >>>>>>>>>>> [ 4220.854535] CIFS: fs/cifs/dir.c: NULL inode in lookup
> >> >>>>>>>>>>> [ 4220.854536] CIFS: fs/cifs/dir.c: Full path: \bashprompt=
.sh inode =3D
> >> >>>>>>>>>>> 0x0000000000000000
> >> >>>>>>>>>>> [ 4220.854546] CIFS: fs/cifs/smb2pdu.c: smb2_reconnect: ab=
orting
> >> >>>>>>>>>>> reconnect due to a received signal by the process
> >> >>>>>>>>>>> [ 4220.854549] CIFS: fs/cifs/inode.c: cifs_get_inode_info:=
 unhandled err rc -512
> >> >>>>>>>>>>> [ 4220.854552] CIFS: fs/cifs/dir.c: Unexpected lookup erro=
r -512
> >> >>>>>>>>>>> [ 4220.854554] CIFS: fs/cifs/dir.c: VFS: leaving cifs_look=
up (xid =3D
> >> >>>>>>>>>>> 638) rc =3D -512
> >> >>>>>>>>>>> [ 4220.855211] CIFS: fs/cifs/inode.c: VFS: in
> >> >>>>>>>>>>> cifs_revalidate_dentry_attr as Xid: 639 with uid: 0
> >> >>>>>>>>>>> [ 4220.855218] CIFS: fs/cifs/inode.c: Update attributes: \=
bin inode
> >> >>>>>>>>>>> 0x00000000b30e5246 count 1 dentry: 0x0000000080235318 d_ti=
me
> >> >>>>>>>>>>> 4295826505 jiffies 4295947521
> >> >>>>>>>>>>> [ 4220.856348] CIFS: fs/cifs/cifsfs.c: VFS: in cifs_statfs=
 as Xid: 640
> >> >>>>>>>>>>> with uid: 1000
> >> >>>>>>>>>>> [ 4225.844263] CIFS: fs/cifs/dns_resolve.c:
> >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: cheekon
> >> >>>>>>>>>>> [ 4225.844273] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve server =
part of
> >> >>>>>>>>>>> cheekon to IP: -4
> >> >>>>>>>>>>> [ 4225.844276] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution sched=
uled for 600
> >> >>>>>>>>>>> seconds in the future
> >> >>>>>>>>>>> [ 4225.844281] CIFS: fs/cifs/connect.c: __cifs_reconnect:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> >> >>>>>>>>>>> [ 4225.844283] CIFS: fs/cifs/connect.c: generic_ip_connect=
: connecting
> >> >>>>>>>>>>> to 192.168.0.20:445
> >> >>>>>>>>>>> [ 4225.844293] CIFS: fs/cifs/connect.c: Socket created
> >> >>>>>>>>>>> [ 4225.844295] CIFS: fs/cifs/connect.c: sndbuf 16384 rcvbu=
f 131072
> >> >>>>>>>>>>> rcvtimeo 0x6d6
> >> >>>>>>>>>>> [ 4228.912632] CIFS: fs/cifs/connect.c: Error -113 connect=
ing to server
> >> >>>>>>>>>>> [ 4228.912670] CIFS: fs/cifs/connect.c: __cifs_reconnect: =
reconnect error -113
> >> >>>>>>>>>>> [ 4231.088378] CIFS: fs/cifs/smb2pdu.c: gave up waiting on=
 reconnect in smb_init
> >> >>>>>>>>>>> [ 4231.088383] CIFS: fs/cifs/smb2pdu.c: gave up waiting on=
 reconnect in smb_init
> >> >>>>>>>>>>> [ 4231.088385] cifs_small_buf_release: 7 callbacks suppres=
sed
> >> >>>>>>>>>>> [ 4231.088387] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4231.088388] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4231.088390] CIFS: fs/cifs/cifsfs.c: VFS: leaving cifs_s=
tatfs (xid =3D
> >> >>>>>>>>>>> 640) rc =3D -112
> >> >>>>>>>>>>> [ 4231.088393] CIFS: fs/cifs/inode.c: cifs_get_inode_info:=
 unhandled err rc -112
> >> >>>>>>>>>>> [ 4231.088398] CIFS: fs/cifs/inode.c: VFS: leaving
> >> >>>>>>>>>>> cifs_revalidate_dentry_attr (xid =3D 639) rc =3D -112
> >> >>>>>>>>>>> [ 4231.088401] CIFS: fs/cifs/dir.c: cifs_revalidate_dentry=
 failed with rc=3D-112
> >> >>>>>>>>>>> [ 4231.088421] CIFS: fs/cifs/inode.c: VFS: in
> >> >>>>>>>>>>> cifs_revalidate_dentry_attr as Xid: 641 with uid: 0
> >> >>>>>>>>>>> [ 4231.088425] CIFS: fs/cifs/inode.c: Update attributes: \=
x86_64 inode
> >> >>>>>>>>>>> 0x000000004022c915 count 1 dentry: 0x00000000669397cc d_ti=
me
> >> >>>>>>>>>>> 4295826508 jiffies 4295950080
> >> >>>>>>>>>>> [ 4232.112342] CIFS: fs/cifs/dns_resolve.c:
> >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is who=
le unc:
> >> >>>>>>>>>>> \\cheekon
> >> >>>>>>>>>>> [ 4238.141384] CIFS: fs/cifs/dns_resolve.c:
> >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: cheekon
> >> >>>>>>>>>>> [ 4238.141400] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve server =
part of
> >> >>>>>>>>>>> cheekon to IP: -4
> >> >>>>>>>>>>> [ 4238.141408] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution sched=
uled for 600
> >> >>>>>>>>>>> seconds in the future
> >> >>>>>>>>>>> [ 4238.141417] CIFS: fs/cifs/connect.c: __cifs_reconnect:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> >> >>>>>>>>>>> [ 4238.141422] CIFS: fs/cifs/connect.c: generic_ip_connect=
: connecting
> >> >>>>>>>>>>> to 192.168.0.20:445
> >> >>>>>>>>>>> [ 4238.141441] CIFS: fs/cifs/connect.c: Socket created
> >> >>>>>>>>>>> [ 4238.141445] CIFS: fs/cifs/connect.c: sndbuf 16384 rcvbu=
f 131072
> >> >>>>>>>>>>> rcvtimeo 0x6d6
> >> >>>>>>>>>>> [ 4241.200798] CIFS: fs/cifs/connect.c: Error -113 connect=
ing to server
> >> >>>>>>>>>>> [ 4241.200826] CIFS: fs/cifs/connect.c: __cifs_reconnect: =
reconnect error -113
> >> >>>>>>>>>>> [ 4241.328397] CIFS: fs/cifs/smb2pdu.c: gave up waiting on=
 reconnect in smb_init
> >> >>>>>>>>>>> [ 4241.328409] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4241.328417] CIFS: fs/cifs/inode.c: cifs_get_inode_info:=
 unhandled err rc -112
> >> >>>>>>>>>>> [ 4241.328423] CIFS: fs/cifs/inode.c: VFS: leaving
> >> >>>>>>>>>>> cifs_revalidate_dentry_attr (xid =3D 641) rc =3D -112
> >> >>>>>>>>>>> [ 4241.328426] CIFS: fs/cifs/dir.c: cifs_revalidate_dentry=
 failed with rc=3D-112
> >> >>>>>>>>>>> [ 4244.400422] CIFS: fs/cifs/dns_resolve.c:
> >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is who=
le unc:
> >> >>>>>>>>>>> \\cheekon
> >> >>>>>>>>>>> [ 4250.434011] CIFS: fs/cifs/dns_resolve.c:
> >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: cheekon
> >> >>>>>>>>>>> [ 4250.434033] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve server =
part of
> >> >>>>>>>>>>> cheekon to IP: -4
> >> >>>>>>>>>>> [ 4250.434043] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution sched=
uled for 600
> >> >>>>>>>>>>> seconds in the future
> >> >>>>>>>>>>> [ 4250.434056] CIFS: fs/cifs/connect.c: __cifs_reconnect:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> >> >>>>>>>>>>> [ 4250.434063] CIFS: fs/cifs/connect.c: generic_ip_connect=
: connecting
> >> >>>>>>>>>>> to 192.168.0.20:445
> >> >>>>>>>>>>> [ 4250.434086] CIFS: fs/cifs/connect.c: Socket created
> >> >>>>>>>>>>> [ 4250.434091] CIFS: fs/cifs/connect.c: sndbuf 16384 rcvbu=
f 131072
> >> >>>>>>>>>>> rcvtimeo 0x6d6
> >> >>>>>>>>>>> [ 4253.488848] CIFS: fs/cifs/connect.c: Error -113 connect=
ing to server
> >> >>>>>>>>>>> [ 4253.488875] CIFS: fs/cifs/connect.c: __cifs_reconnect: =
reconnect error -113
> >> >>>>>>>>>>> [ 4256.688419] CIFS: fs/cifs/dns_resolve.c:
> >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is who=
le unc:
> >> >>>>>>>>>>> \\cheekon
> >> >>>>>>>>>>> [ 4265.790981] CIFS: fs/cifs/dns_resolve.c:
> >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: cheekon
> >> >>>>>>>>>>> [ 4265.790995] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve server =
part of
> >> >>>>>>>>>>> cheekon to IP: -4
> >> >>>>>>>>>>> [ 4265.791000] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution sched=
uled for 600
> >> >>>>>>>>>>> seconds in the future
> >> >>>>>>>>>>> [ 4265.791005] CIFS: fs/cifs/connect.c: __cifs_reconnect:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> >> >>>>>>>>>>> [ 4265.791008] CIFS: fs/cifs/connect.c: generic_ip_connect=
: connecting
> >> >>>>>>>>>>> to 192.168.0.20:445
> >> >>>>>>>>>>> [ 4265.791022] CIFS: fs/cifs/connect.c: Socket created
> >> >>>>>>>>>>> [ 4265.791025] CIFS: fs/cifs/connect.c: sndbuf 16384 rcvbu=
f 131072
> >> >>>>>>>>>>> rcvtimeo 0x6d6
> >> >>>>>>>>>>> [ 4268.848709] CIFS: fs/cifs/connect.c: Error -113 connect=
ing to server
> >> >>>>>>>>>>> [ 4268.848752] CIFS: fs/cifs/connect.c: __cifs_reconnect: =
reconnect error -113
> >> >>>>>>>>>>> [ 4272.052440] CIFS: fs/cifs/dns_resolve.c:
> >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is who=
le unc:
> >> >>>>>>>>>>> \\cheekon
> >> >>>>>>>>>>> [ 4278.078864] CIFS: fs/cifs/dns_resolve.c:
> >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: cheekon
> >> >>>>>>>>>>> [ 4278.078889] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve server =
part of
> >> >>>>>>>>>>> cheekon to IP: -4
> >> >>>>>>>>>>> [ 4278.078898] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution sched=
uled for 600
> >> >>>>>>>>>>> seconds in the future
> >> >>>>>>>>>>> [ 4278.078904] CIFS: fs/cifs/connect.c: __cifs_reconnect:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> >> >>>>>>>>>>> [ 4278.078911] CIFS: fs/cifs/connect.c: generic_ip_connect=
: connecting
> >> >>>>>>>>>>> to 192.168.0.20:445
> >> >>>>>>>>>>> [ 4278.078937] CIFS: fs/cifs/connect.c: Socket created
> >> >>>>>>>>>>> [ 4278.078942] CIFS: fs/cifs/connect.c: sndbuf 16384 rcvbu=
f 131072
> >> >>>>>>>>>>> rcvtimeo 0x6d6
> >> >>>>>>>>>>> [ 4280.826140] CIFS: fs/cifs/cifsfs.c: VFS: in cifs_statfs=
 as Xid: 642
> >> >>>>>>>>>>> with uid: 1000
> >> >>>>>>>>>>> [ 4281.136704] CIFS: fs/cifs/connect.c: Error -113 connect=
ing to server
> >> >>>>>>>>>>> [ 4281.136737] CIFS: fs/cifs/connect.c: __cifs_reconnect: =
reconnect error -113
> >> >>>>>>>>>>> [ 4284.336534] CIFS: fs/cifs/dns_resolve.c:
> >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is who=
le unc:
> >> >>>>>>>>>>> \\cheekon
> >> >>>>>>>>>>> [ 4290.992510] CIFS: fs/cifs/smb2pdu.c: gave up waiting on=
 reconnect in smb_init
> >> >>>>>>>>>>> [ 4290.992532] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4290.992543] CIFS: fs/cifs/cifsfs.c: VFS: leaving cifs_s=
tatfs (xid =3D
> >> >>>>>>>>>>> 642) rc =3D -112
> >> >>>>>>>>>>> [ 4292.289757] CIFS: fs/cifs/dns_resolve.c:
> >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: cheekon
> >> >>>>>>>>>>> [ 4292.289765] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve server =
part of
> >> >>>>>>>>>>> cheekon to IP: -4
> >> >>>>>>>>>>> [ 4292.289769] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution sched=
uled for 600
> >> >>>>>>>>>>> seconds in the future
> >> >>>>>>>>>>> [ 4292.289773] CIFS: fs/cifs/connect.c: __cifs_reconnect:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> >> >>>>>>>>>>> [ 4292.289776] CIFS: fs/cifs/connect.c: generic_ip_connect=
: connecting
> >> >>>>>>>>>>> to 192.168.0.20:445
> >> >>>>>>>>>>> [ 4292.289793] CIFS: fs/cifs/connect.c: Socket created
> >> >>>>>>>>>>> [ 4292.289794] CIFS: fs/cifs/connect.c: sndbuf 16384 rcvbu=
f 131072
> >> >>>>>>>>>>> rcvtimeo 0x6d6
> >> >>>>>>>>>>> [ 4295.348741] CIFS: fs/cifs/connect.c: Error -113 connect=
ing to server
> >> >>>>>>>>>>> [ 4295.348773] CIFS: fs/cifs/connect.c: __cifs_reconnect: =
reconnect error -113
> >> >>>>>>>>>>> [ 4298.416556] CIFS: fs/cifs/dns_resolve.c:
> >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is who=
le unc:
> >> >>>>>>>>>>> \\cheekon
> >> >>>>>>>>>>> [ 4308.425564] CIFS: fs/cifs/dns_resolve.c:
> >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: cheekon
> >> >>>>>>>>>>> [ 4308.425582] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve server =
part of
> >> >>>>>>>>>>> cheekon to IP: -4
> >> >>>>>>>>>>> [ 4308.425589] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution sched=
uled for 600
> >> >>>>>>>>>>> seconds in the future
> >> >>>>>>>>>>> [ 4308.425595] CIFS: fs/cifs/connect.c: __cifs_reconnect:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> >> >>>>>>>>>>> [ 4308.425599] CIFS: fs/cifs/connect.c: generic_ip_connect=
: connecting
> >> >>>>>>>>>>> to 192.168.0.20:445
> >> >>>>>>>>>>> [ 4308.425621] CIFS: fs/cifs/connect.c: Socket created
> >> >>>>>>>>>>> [ 4308.425625] CIFS: fs/cifs/connect.c: sndbuf 16384 rcvbu=
f 131072
> >> >>>>>>>>>>> rcvtimeo 0x6d6
> >> >>>>>>>>>>> [ 4311.505060] CIFS: fs/cifs/connect.c: Error -113 connect=
ing to server
> >> >>>>>>>>>>> [ 4311.505094] CIFS: fs/cifs/connect.c: __cifs_reconnect: =
reconnect error -113
> >> >>>>>>>>>>> [ 4314.544551] CIFS: fs/cifs/dns_resolve.c:
> >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is who=
le unc:
> >> >>>>>>>>>>> \\cheekon
> >> >>>>>>>>>>> [ 4323.328365] CIFS: fs/cifs/dns_resolve.c:
> >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: cheekon
> >> >>>>>>>>>>> [ 4323.328387] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve server =
part of
> >> >>>>>>>>>>> cheekon to IP: -4
> >> >>>>>>>>>>> [ 4323.328397] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution sched=
uled for 600
> >> >>>>>>>>>>> seconds in the future
> >> >>>>>>>>>>> [ 4323.328406] CIFS: fs/cifs/connect.c: __cifs_reconnect:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> >> >>>>>>>>>>> [ 4323.328413] CIFS: fs/cifs/connect.c: generic_ip_connect=
: connecting
> >> >>>>>>>>>>> to 192.168.0.20:445
> >> >>>>>>>>>>> [ 4323.328437] CIFS: fs/cifs/connect.c: Socket created
> >> >>>>>>>>>>> [ 4323.328441] CIFS: fs/cifs/connect.c: sndbuf 16384 rcvbu=
f 131072
> >> >>>>>>>>>>> rcvtimeo 0x6d6
> >> >>>>>>>>>>> [ 4326.384727] CIFS: fs/cifs/connect.c: Error -113 connect=
ing to server
> >> >>>>>>>>>>> [ 4326.384755] CIFS: fs/cifs/connect.c: __cifs_reconnect: =
reconnect error -113
> >> >>>>>>>>>>> [ 4329.392599] CIFS: fs/cifs/dns_resolve.c:
> >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is who=
le unc:
> >> >>>>>>>>>>> \\cheekon
> >> >>>>>>>>>>> [ 4339.406543] CIFS: fs/cifs/dns_resolve.c:
> >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: cheekon
> >> >>>>>>>>>>> [ 4339.406550] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve server =
part of
> >> >>>>>>>>>>> cheekon to IP: -4
> >> >>>>>>>>>>> [ 4339.406553] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution sched=
uled for 600
> >> >>>>>>>>>>> seconds in the future
> >> >>>>>>>>>>> [ 4339.406556] CIFS: fs/cifs/connect.c: __cifs_reconnect:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> >> >>>>>>>>>>> [ 4339.406559] CIFS: fs/cifs/connect.c: generic_ip_connect=
: connecting
> >> >>>>>>>>>>> to 192.168.0.20:445
> >> >>>>>>>>>>> [ 4339.406567] CIFS: fs/cifs/connect.c: Socket created
> >> >>>>>>>>>>> [ 4339.406568] CIFS: fs/cifs/connect.c: sndbuf 16384 rcvbu=
f 131072
> >> >>>>>>>>>>> rcvtimeo 0x6d6
> >> >>>>>>>>>>> [ 4340.826465] CIFS: fs/cifs/cifsfs.c: VFS: in cifs_statfs=
 as Xid: 643
> >> >>>>>>>>>>> with uid: 1000
> >> >>>>>>>>>>> [ 4342.481043] CIFS: fs/cifs/connect.c: Error -113 connect=
ing to server
> >> >>>>>>>>>>> [ 4342.481071] CIFS: fs/cifs/connect.c: __cifs_reconnect: =
reconnect error -113
> >> >>>>>>>>>>> [ 4343.513393] CIFS: fs/cifs/inode.c: VFS: in
> >> >>>>>>>>>>> cifs_revalidate_dentry_attr as Xid: 644 with uid: 0
> >> >>>>>>>>>>> [ 4343.513400] CIFS: fs/cifs/inode.c: Update attributes:  =
inode
> >> >>>>>>>>>>> 0x00000000cc8fcd81 count 2 dentry: 0x000000002b8e3e8b d_ti=
me 0 jiffies
> >> >>>>>>>>>>> 4295978186
> >> >>>>>>>>>>> [ 4345.520578] CIFS: fs/cifs/dns_resolve.c:
> >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is who=
le unc:
> >> >>>>>>>>>>> \\cheekon
> >> >>>>>>>>>>> [ 4350.900608] CIFS: fs/cifs/smb2pdu.c: gave up waiting on=
 reconnect in smb_init
> >> >>>>>>>>>>> [ 4350.900628] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4350.900632] CIFS: fs/cifs/cifsfs.c: VFS: leaving cifs_s=
tatfs (xid =3D
> >> >>>>>>>>>>> 643) rc =3D -112
> >> >>>>>>>>>>> [ 4353.712700] CIFS: fs/cifs/smb2pdu.c: gave up waiting on=
 reconnect in smb_init
> >> >>>>>>>>>>> [ 4353.712720] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4353.712728] CIFS: fs/cifs/inode.c: cifs_get_inode_info:=
 unhandled err rc -112
> >> >>>>>>>>>>> [ 4353.712734] CIFS: fs/cifs/inode.c: VFS: leaving
> >> >>>>>>>>>>> cifs_revalidate_dentry_attr (xid =3D 644) rc =3D -112
> >> >>>>>>>>>>> [ 4353.714004] CIFS: fs/cifs/connect.c: cifs_put_tcon: tc_=
count=3D1
> >> >>>>>>>>>>> [ 4353.714015] CIFS: fs/cifs/connect.c: VFS: in cifs_put_t=
con as Xid:
> >> >>>>>>>>>>> 645 with uid: 0
> >> >>>>>>>>>>> [ 4353.714020] CIFS: fs/cifs/smb2pdu.c: Tree Disconnect
> >> >>>>>>>>>>> [ 4353.714024] CIFS: fs/cifs/fscache.c:
> >> >>>>>>>>>>> cifs_fscache_release_super_cookie: (0x0000000000000000)
> >> >>>>>>>>>>> [ 4353.714032] CIFS: fs/cifs/connect.c: cifs_put_smb_ses: =
ses_count=3D1
> >> >>>>>>>>>>> [ 4353.714037] CIFS: fs/cifs/connect.c: cifs_put_smb_ses: =
ses_count=3D1
> >> >>>>>>>>>>> [ 4353.714039] CIFS: fs/cifs/connect.c: cifs_put_smb_ses: =
ses ipc:
> >> >>>>>>>>>>> \\cheekon\IPC$
> >> >>>>>>>>>>> [ 4355.529971] CIFS: fs/cifs/dns_resolve.c:
> >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: cheekon
> >> >>>>>>>>>>> [ 4355.529988] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve server =
part of
> >> >>>>>>>>>>> \x1b\x86\xb9\xeaj1\x15\xb2;\x87\xb9\xeaj1\x15\x8a@\x04 to =
IP: -4
> >> >>>>>>>>>>> [ 4355.529996] CIFS: fs/cifs/connect.c:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution sched=
uled for 600
> >> >>>>>>>>>>> seconds in the future
> >> >>>>>>>>>>> [ 4355.530002] CIFS: fs/cifs/connect.c: __cifs_reconnect:
> >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> >> >>>>>>>>>>> [ 4355.530006] CIFS: fs/cifs/connect.c: generic_ip_connect=
: connecting
> >> >>>>>>>>>>> to 192.168.0.20:445
> >> >>>>>>>>>>> [ 4355.530025] CIFS: fs/cifs/connect.c: Socket created
> >> >>>>>>>>>>> [ 4355.530027] CIFS: fs/cifs/connect.c: sndbuf 16384 rcvbu=
f 131072
> >> >>>>>>>>>>> rcvtimeo 0x6d6
> >> >>>>>>>>>>> [ 4355.530185] CIFS: fs/cifs/connect.c: Error -4 connectin=
g to server
> >> >>>>>>>>>>> [ 4355.530201] CIFS: fs/cifs/connect.c: __cifs_reconnect: =
reconnect error -4
> >> >>>>>>>>>>> [ 4372.001470] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link=
 becomes ready
> >> >>>>>>>>>>> [ 4377.427015] smb3_fs_context_parse_param: 1 callbacks su=
ppressed
> >> >>>>>>>>>>> [ 4377.427018] CIFS: fs/cifs/fs_context.c: CIFS: parsing c=
ifs mount
> >> >>>>>>>>>>> option 'source'
> >> >>>>>>>>>>> [ 4377.427025] CIFS: fs/cifs/fs_context.c: CIFS: parsing c=
ifs mount option 'ip'
> >> >>>>>>>>>>> [ 4377.427028] CIFS: fs/cifs/fs_context.c: CIFS: parsing c=
ifs mount option 'unc'
> >> >>>>>>>>>>> [ 4377.427030] CIFS: fs/cifs/fs_context.c: CIFS: parsing c=
ifs mount
> >> >>>>>>>>>>> option 'forceuid'
> >> >>>>>>>>>>> [ 4377.427032] CIFS: fs/cifs/fs_context.c: CIFS: parsing c=
ifs mount
> >> >>>>>>>>>>> option 'resilienthandles'
> >> >>>>>>>>>>> [ 4377.427033] CIFS: fs/cifs/fs_context.c: CIFS: parsing c=
ifs mount
> >> >>>>>>>>>>> option 'vers'
> >> >>>>>>>>>>> [ 4377.427036] CIFS: fs/cifs/fs_context.c: CIFS: parsing c=
ifs mount
> >> >>>>>>>>>>> option 'iocharset'
> >> >>>>>>>>>>> [ 4377.427038] CIFS: fs/cifs/fs_context.c: iocharset set t=
o utf8
> >> >>>>>>>>>>> [ 4377.427039] CIFS: fs/cifs/fs_context.c: CIFS: parsing c=
ifs mount
> >> >>>>>>>>>>> option 'cifsacl'
> >> >>>>>>>>>>> [ 4377.427040] CIFS: fs/cifs/fs_context.c: CIFS: parsing c=
ifs mount option 'uid'
> >> >>>>>>>>>>> [ 4377.427043] CIFS: fs/cifs/fs_context.c: CIFS: parsing c=
ifs mount
> >> >>>>>>>>>>> option 'user'
> >> >>>>>>>>>>> [ 4377.427047] CIFS: fs/cifs/cifsfs.c: Devname: \\cheekon\=
localnet flags: 0
> >> >>>>>>>>>>> [ 4377.427050] CIFS: fs/cifs/connect.c: Username: localnet
> >> >>>>>>>>>>> [ 4377.427052] CIFS: fs/cifs/connect.c: file mode: 0755  d=
ir mode: 0755
> >> >>>>>>>>>>> [ 4377.427055] CIFS: fs/cifs/connect.c: VFS: in mount_get_=
conns as
> >> >>>>>>>>>>> Xid: 646 with uid: 0
> >> >>>>>>>>>>> [ 4377.427057] CIFS: fs/cifs/connect.c: UNC: \\cheekon\loc=
alnet
> >> >>>>>>>>>>> [ 4377.427060] CIFS: fs/cifs/connect.c: generic_ip_connect=
: connecting
> >> >>>>>>>>>>> to 192.168.0.20:445
> >> >>>>>>>>>>> [ 4377.427067] CIFS: fs/cifs/connect.c: Socket created
> >> >>>>>>>>>>> [ 4377.427069] CIFS: fs/cifs/connect.c: sndbuf 16384 rcvbu=
f 131072
> >> >>>>>>>>>>> rcvtimeo 0x6d6
> >> >>>>>>>>>>> [ 4377.428082] CIFS: fs/cifs/connect.c: cifs_get_tcp_sessi=
on: next dns
> >> >>>>>>>>>>> resolution scheduled for 600 seconds in the future
> >> >>>>>>>>>>> [ 4377.428086] CIFS: fs/cifs/connect.c: VFS: in cifs_get_s=
mb_ses as
> >> >>>>>>>>>>> Xid: 647 with uid: 0
> >> >>>>>>>>>>> [ 4377.428089] CIFS: fs/cifs/connect.c: Existing smb sess =
not found
> >> >>>>>>>>>>> [ 4377.428093] CIFS: fs/cifs/smb2pdu.c: Negotiate protocol
> >> >>>>>>>>>>> [ 4377.428093] CIFS: fs/cifs/connect.c: Demultiplex PID: 7=
7240
> >> >>>>>>>>>>> [ 4377.428098] CIFS: fs/cifs/transport.c: wait_for_free_cr=
edits:
> >> >>>>>>>>>>> remove 1 credits total=3D0
> >> >>>>>>>>>>> [ 4377.428113] CIFS: fs/cifs/transport.c: Sending smb: smb=
_len=3D220
> >> >>>>>>>>>>> [ 4377.432265] CIFS: fs/cifs/connect.c: RFC1002 header 0x1=
0c
> >> >>>>>>>>>>> [ 4377.432272] CIFS: fs/cifs/smb2misc.c: SMB2 data length =
74 offset 128
> >> >>>>>>>>>>> [ 4377.432274] CIFS: fs/cifs/smb2misc.c: SMB2 len 202
> >> >>>>>>>>>>> [ 4377.432276] CIFS: fs/cifs/smb2misc.c: length of negcont=
exts 60 pad 6
> >> >>>>>>>>>>> [ 4377.432279] CIFS: fs/cifs/smb2ops.c: smb2_add_credits: =
added 1
> >> >>>>>>>>>>> credits total=3D1
> >> >>>>>>>>>>> [ 4377.432305] CIFS: fs/cifs/transport.c: cifs_sync_mid_re=
sult: cmd=3D0
> >> >>>>>>>>>>> mid=3D0 state=3D4
> >> >>>>>>>>>>> [ 4377.432314] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4377.432317] CIFS: fs/cifs/smb2pdu.c: mode 0x1
> >> >>>>>>>>>>> [ 4377.432319] CIFS: fs/cifs/smb2pdu.c: negotiated smb3.1.=
1 dialect
> >> >>>>>>>>>>> [ 4377.432322] CIFS: fs/cifs/smb2pdu.c: decoding 2 negotia=
te contexts
> >> >>>>>>>>>>> [ 4377.432324] CIFS: fs/cifs/smb2pdu.c: decode SMB3.11 enc=
ryption neg
> >> >>>>>>>>>>> context of len 4
> >> >>>>>>>>>>> [ 4377.432326] CIFS: fs/cifs/smb2pdu.c: SMB311 cipher type=
:2
> >> >>>>>>>>>>> [ 4377.432328] CIFS: fs/cifs/connect.c: Security Mode: 0x1
> >> >>>>>>>>>>> Capabilities: 0x300046 TimeAdjust: 0
> >> >>>>>>>>>>> [ 4377.432332] CIFS: fs/cifs/smb2pdu.c: Session Setup
> >> >>>>>>>>>>> [ 4377.432333] CIFS: fs/cifs/smb2pdu.c: sess setup type 2
> >> >>>>>>>>>>> [ 4377.432336] CIFS: fs/cifs/smb2pdu.c: Fresh session. Pre=
vious: 0
> >> >>>>>>>>>>> [ 4377.432338] CIFS: fs/cifs/transport.c: wait_for_free_cr=
edits:
> >> >>>>>>>>>>> remove 1 credits total=3D0
> >> >>>>>>>>>>> [ 4377.432346] CIFS: fs/cifs/transport.c: Sending smb: smb=
_len=3D136
> >> >>>>>>>>>>> [ 4377.433477] CIFS: fs/cifs/connect.c: RFC1002 header 0xd=
a
> >> >>>>>>>>>>> [ 4377.433483] CIFS: fs/cifs/smb2misc.c: SMB2 data length =
146 offset 72
> >> >>>>>>>>>>> [ 4377.433485] CIFS: fs/cifs/smb2misc.c: SMB2 len 218
> >> >>>>>>>>>>> [ 4377.433488] CIFS: fs/cifs/smb2ops.c: smb2_add_credits: =
added 1
> >> >>>>>>>>>>> credits total=3D1
> >> >>>>>>>>>>> [ 4377.433512] CIFS: fs/cifs/transport.c: cifs_sync_mid_re=
sult: cmd=3D1
> >> >>>>>>>>>>> mid=3D1 state=3D4
> >> >>>>>>>>>>> [ 4377.433518] CIFS: Status code returned 0xc0000016
> >> >>>>>>>>>>> STATUS_MORE_PROCESSING_REQUIRED
> >> >>>>>>>>>>> [ 4377.433526] CIFS: fs/cifs/smb2maperror.c: Mapping SMB2 =
status code
> >> >>>>>>>>>>> 0xc0000016 to POSIX err -5
> >> >>>>>>>>>>> [ 4377.433531] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4377.433534] CIFS: fs/cifs/sess.c: decode_ntlmssp_challe=
nge:
> >> >>>>>>>>>>> negotiate=3D0xe2088235 challenge=3D0xe28a8235
> >> >>>>>>>>>>> [ 4377.433536] CIFS: fs/cifs/smb2pdu.c: rawntlmssp session=
 setup challenge phase
> >> >>>>>>>>>>> [ 4377.433539] CIFS: fs/cifs/smb2pdu.c: Fresh session. Pre=
vious: 0
> >> >>>>>>>>>>> [ 4377.433558] CIFS: fs/cifs/transport.c: wait_for_free_cr=
edits:
> >> >>>>>>>>>>> remove 1 credits total=3D0
> >> >>>>>>>>>>> [ 4377.433565] CIFS: fs/cifs/transport.c: Sending smb: smb=
_len=3D320
> >> >>>>>>>>>>> [ 4377.446423] CIFS: fs/cifs/connect.c: RFC1002 header 0x4=
8
> >> >>>>>>>>>>> [ 4377.446436] CIFS: fs/cifs/smb2misc.c: SMB2 data length =
0 offset 72
> >> >>>>>>>>>>> [ 4377.446440] CIFS: fs/cifs/smb2misc.c: SMB2 len 73
> >> >>>>>>>>>>> [ 4377.446442] CIFS: fs/cifs/smb2misc.c: Calculated size 7=
3 length 72
> >> >>>>>>>>>>> mismatch mid 2
> >> >>>>>>>>>>> [ 4377.446446] CIFS: fs/cifs/smb2ops.c: smb2_add_credits: =
added 130
> >> >>>>>>>>>>> credits total=3D130
> >> >>>>>>>>>>> [ 4377.446478] CIFS: fs/cifs/transport.c: cifs_sync_mid_re=
sult: cmd=3D1
> >> >>>>>>>>>>> mid=3D2 state=3D4
> >> >>>>>>>>>>> [ 4377.446484] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4377.446499] CIFS: fs/cifs/smb2pdu.c: SMB2/3 session est=
ablished successfully
> >> >>>>>>>>>>> [ 4377.446502] CIFS: fs/cifs/sess.c: Cleared reconnect bit=
mask for
> >> >>>>>>>>>>> chan 0; now 0x0
> >> >>>>>>>>>>> [ 4377.446505] CIFS: fs/cifs/connect.c: VFS: leaving cifs_=
get_smb_ses
> >> >>>>>>>>>>> (xid =3D 647) rc =3D 0
> >> >>>>>>>>>>> [ 4377.446508] CIFS: fs/cifs/connect.c: VFS: in cifs_setup=
_ipc as Xid:
> >> >>>>>>>>>>> 648 with uid: 0
> >> >>>>>>>>>>> [ 4377.446510] CIFS: fs/cifs/smb2pdu.c: TCON
> >> >>>>>>>>>>> [ 4377.446513] CIFS: fs/cifs/transport.c: wait_for_free_cr=
edits:
> >> >>>>>>>>>>> remove 1 credits total=3D129
> >> >>>>>>>>>>> [ 4377.446539] CIFS: fs/cifs/smb2ops.c: Encrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4377.446548] CIFS: fs/cifs/transport.c: Sending smb: smb=
_len=3D158
> >> >>>>>>>>>>> [ 4377.455288] CIFS: fs/cifs/connect.c: RFC1002 header 0x8=
4
> >> >>>>>>>>>>> [ 4377.455308] CIFS: fs/cifs/smb2ops.c: Decrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4377.455310] CIFS: fs/cifs/smb2ops.c: mid found
> >> >>>>>>>>>>> [ 4377.455312] CIFS: fs/cifs/smb2misc.c: SMB2 len 80
> >> >>>>>>>>>>> [ 4377.455315] CIFS: fs/cifs/smb2ops.c: smb2_add_credits: =
added 64
> >> >>>>>>>>>>> credits total=3D191
> >> >>>>>>>>>>> [ 4377.455344] CIFS: fs/cifs/transport.c: cifs_sync_mid_re=
sult: cmd=3D3
> >> >>>>>>>>>>> mid=3D3 state=3D4
> >> >>>>>>>>>>> [ 4377.455349] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4377.455352] CIFS: fs/cifs/smb2pdu.c: connection to pipe=
 share
> >> >>>>>>>>>>> [ 4377.455355] CIFS: fs/cifs/connect.c: VFS: leaving cifs_=
setup_ipc
> >> >>>>>>>>>>> (xid =3D 648) rc =3D 0
> >> >>>>>>>>>>> [ 4377.455357] CIFS: fs/cifs/connect.c: IPC tcon rc =3D 0 =
ipc tid =3D -1798775872
> >> >>>>>>>>>>> [ 4377.455362] CIFS: fs/cifs/connect.c: VFS: in cifs_get_t=
con as Xid:
> >> >>>>>>>>>>> 649 with uid: 0
> >> >>>>>>>>>>> [ 4377.455364] CIFS: fs/cifs/smb2pdu.c: TCON
> >> >>>>>>>>>>> [ 4377.455367] CIFS: fs/cifs/transport.c: wait_for_free_cr=
edits:
> >> >>>>>>>>>>> remove 1 credits total=3D190
> >> >>>>>>>>>>> [ 4377.455376] CIFS: fs/cifs/smb2ops.c: Encrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4377.455384] CIFS: fs/cifs/transport.c: Sending smb: smb=
_len=3D166
> >> >>>>>>>>>>> [ 4377.457328] CIFS: fs/cifs/connect.c: RFC1002 header 0x8=
4
> >> >>>>>>>>>>> [ 4377.457341] CIFS: fs/cifs/smb2ops.c: Decrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4377.457343] CIFS: fs/cifs/smb2ops.c: mid found
> >> >>>>>>>>>>> [ 4377.457345] CIFS: fs/cifs/smb2misc.c: SMB2 len 80
> >> >>>>>>>>>>> [ 4377.457347] CIFS: fs/cifs/smb2ops.c: smb2_add_credits: =
added 64
> >> >>>>>>>>>>> credits total=3D254
> >> >>>>>>>>>>> [ 4377.457373] CIFS: fs/cifs/transport.c: cifs_sync_mid_re=
sult: cmd=3D3
> >> >>>>>>>>>>> mid=3D4 state=3D4
> >> >>>>>>>>>>> [ 4377.457378] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4377.457380] CIFS: fs/cifs/smb2pdu.c: connection to disk=
 share
> >> >>>>>>>>>>> [ 4377.457383] CIFS: fs/cifs/connect.c: VFS: leaving cifs_=
get_tcon
> >> >>>>>>>>>>> (xid =3D 649) rc =3D 0
> >> >>>>>>>>>>> [ 4377.457385] CIFS: fs/cifs/connect.c: Tcon rc =3D 0
> >> >>>>>>>>>>> [ 4377.457388] CIFS: fs/cifs/smb2pdu.c: create/open
> >> >>>>>>>>>>> [ 4377.457391] CIFS: fs/cifs/transport.c: wait_for_free_cr=
edits:
> >> >>>>>>>>>>> remove 1 credits total=3D253
> >> >>>>>>>>>>> [ 4377.457400] CIFS: fs/cifs/smb2ops.c: Encrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4377.457407] CIFS: fs/cifs/transport.c: Sending smb: smb=
_len=3D208
> >> >>>>>>>>>>> [ 4377.458319] CIFS: fs/cifs/connect.c: RFC1002 header 0x1=
04
> >> >>>>>>>>>>> [ 4377.458331] CIFS: fs/cifs/smb2ops.c: Decrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4377.458333] CIFS: fs/cifs/smb2ops.c: mid found
> >> >>>>>>>>>>> [ 4377.458334] CIFS: fs/cifs/smb2misc.c: SMB2 data length =
56 offset 152
> >> >>>>>>>>>>> [ 4377.458336] CIFS: fs/cifs/smb2misc.c: SMB2 len 208
> >> >>>>>>>>>>> [ 4377.458338] CIFS: fs/cifs/smb2ops.c: smb2_add_credits: =
added 10
> >> >>>>>>>>>>> credits total=3D263
> >> >>>>>>>>>>> [ 4377.458362] CIFS: fs/cifs/transport.c: cifs_sync_mid_re=
sult: cmd=3D5
> >> >>>>>>>>>>> mid=3D5 state=3D4
> >> >>>>>>>>>>> [ 4377.458367] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4377.458371] CIFS: fs/cifs/smb2pdu.c: SMB2 IOCTL
> >> >>>>>>>>>>> [ 4377.458373] CIFS: fs/cifs/transport.c: wait_for_free_cr=
edits:
> >> >>>>>>>>>>> remove 1 credits total=3D262
> >> >>>>>>>>>>> [ 4377.458382] CIFS: fs/cifs/smb2ops.c: Encrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4377.458387] CIFS: fs/cifs/transport.c: Sending smb: smb=
_len=3D177
> >> >>>>>>>>>>> [ 4377.459230] CIFS: fs/cifs/connect.c: RFC1002 header 0x4=
cc
> >> >>>>>>>>>>> [ 4377.459244] CIFS: fs/cifs/smb2ops.c: Decrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4377.459245] CIFS: fs/cifs/smb2ops.c: mid found
> >> >>>>>>>>>>> [ 4377.459247] CIFS: fs/cifs/smb2misc.c: SMB2 data length =
1064 offset 112
> >> >>>>>>>>>>> [ 4377.459248] CIFS: fs/cifs/smb2misc.c: SMB2 len 1176
> >> >>>>>>>>>>> [ 4377.459250] CIFS: fs/cifs/smb2ops.c: smb2_add_credits: =
added 10
> >> >>>>>>>>>>> credits total=3D272
> >> >>>>>>>>>>> [ 4377.459274] CIFS: fs/cifs/transport.c: cifs_sync_mid_re=
sult: cmd=3D11
> >> >>>>>>>>>>> mid=3D6 state=3D4
> >> >>>>>>>>>>> [ 4377.459282] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: adding iface 0
> >> >>>>>>>>>>> [ 4377.459284] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: speed
> >> >>>>>>>>>>> 10000000000 bps
> >> >>>>>>>>>>> [ 4377.459285] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces:
> >> >>>>>>>>>>> capabilities 0x00000001
> >> >>>>>>>>>>> [ 4377.459287] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: ipv4
> >> >>>>>>>>>>> 192.168.0.20
> >> >>>>>>>>>>> [ 4377.459289] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: adding iface 1
> >> >>>>>>>>>>> [ 4377.459290] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: speed
> >> >>>>>>>>>>> 10000000000 bps
> >> >>>>>>>>>>> [ 4377.459291] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces:
> >> >>>>>>>>>>> capabilities 0x00000001
> >> >>>>>>>>>>> [ 4377.459293] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: ipv6
> >> >>>>>>>>>>> fd40:1eef:5174:0000:f872:6d14:bade:233b
> >> >>>>>>>>>>> [ 4377.459294] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: adding iface 2
> >> >>>>>>>>>>> [ 4377.459296] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: speed
> >> >>>>>>>>>>> 10000000000 bps
> >> >>>>>>>>>>> [ 4377.459297] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces:
> >> >>>>>>>>>>> capabilities 0x00000001
> >> >>>>>>>>>>> [ 4377.459298] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: ipv6
> >> >>>>>>>>>>> fd40:1eef:5174:0000:7f90:c7fb:ffa7:a8dd
> >> >>>>>>>>>>> [ 4377.459299] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: adding iface 3
> >> >>>>>>>>>>> [ 4377.459300] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: speed
> >> >>>>>>>>>>> 10000000000 bps
> >> >>>>>>>>>>> [ 4377.459302] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces:
> >> >>>>>>>>>>> capabilities 0x00000001
> >> >>>>>>>>>>> [ 4377.459303] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: ipv6
> >> >>>>>>>>>>> 2001:0470:e1f3:0000:187d:e160:8517:e8df
> >> >>>>>>>>>>> [ 4377.459304] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: adding iface 4
> >> >>>>>>>>>>> [ 4377.459305] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: speed
> >> >>>>>>>>>>> 10000000000 bps
> >> >>>>>>>>>>> [ 4377.459307] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces:
> >> >>>>>>>>>>> capabilities 0x00000001
> >> >>>>>>>>>>> [ 4377.459308] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: ipv6
> >> >>>>>>>>>>> 2001:0470:e1f3:0000:11c8:9923:c250:1d0e
> >> >>>>>>>>>>> [ 4377.459309] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: adding iface 5
> >> >>>>>>>>>>> [ 4377.459310] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: speed
> >> >>>>>>>>>>> 1000000000 bps
> >> >>>>>>>>>>> [ 4377.459311] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces:
> >> >>>>>>>>>>> capabilities 0x00000000
> >> >>>>>>>>>>> [ 4377.459312] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: ipv4 127.0.0.1
> >> >>>>>>>>>>> [ 4377.459314] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: adding iface 6
> >> >>>>>>>>>>> [ 4377.459315] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: speed
> >> >>>>>>>>>>> 1000000000 bps
> >> >>>>>>>>>>> [ 4377.459317] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces:
> >> >>>>>>>>>>> capabilities 0x00000000
> >> >>>>>>>>>>> [ 4377.459318] CIFS: fs/cifs/smb2ops.c: parse_server_inter=
faces: ipv6
> >> >>>>>>>>>>> 0000:0000:0000:0000:0000:0000:0000:0001
> >> >>>>>>>>>>> [ 4377.459321] CIFS: fs/cifs/smb2pdu.c: Query FSInfo level=
 5
> >> >>>>>>>>>>> [ 4377.459324] CIFS: fs/cifs/transport.c: wait_for_free_cr=
edits:
> >> >>>>>>>>>>> remove 1 credits total=3D271
> >> >>>>>>>>>>> [ 4377.459332] CIFS: fs/cifs/smb2ops.c: Encrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4377.459337] CIFS: fs/cifs/transport.c: Sending smb: smb=
_len=3D161
> >> >>>>>>>>>>> [ 4377.460257] CIFS: fs/cifs/connect.c: RFC1002 header 0x9=
0
> >> >>>>>>>>>>> [ 4377.460267] CIFS: fs/cifs/smb2ops.c: Decrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4377.460269] CIFS: fs/cifs/smb2ops.c: mid found
> >> >>>>>>>>>>> [ 4377.460271] CIFS: fs/cifs/smb2misc.c: SMB2 data length =
20 offset 72
> >> >>>>>>>>>>> [ 4377.460272] CIFS: fs/cifs/smb2misc.c: SMB2 len 92
> >> >>>>>>>>>>> [ 4377.460274] CIFS: fs/cifs/smb2ops.c: smb2_add_credits: =
added 10
> >> >>>>>>>>>>> credits total=3D281
> >> >>>>>>>>>>> [ 4377.460299] CIFS: fs/cifs/transport.c: cifs_sync_mid_re=
sult: cmd=3D16
> >> >>>>>>>>>>> mid=3D7 state=3D4
> >> >>>>>>>>>>> [ 4377.460304] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4377.460306] CIFS: fs/cifs/smb2pdu.c: Query FSInfo level=
 4
> >> >>>>>>>>>>> [ 4377.460309] CIFS: fs/cifs/transport.c: wait_for_free_cr=
edits:
> >> >>>>>>>>>>> remove 1 credits total=3D280
> >> >>>>>>>>>>> [ 4377.460317] CIFS: fs/cifs/smb2ops.c: Encrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4377.460322] CIFS: fs/cifs/transport.c: Sending smb: smb=
_len=3D161
> >> >>>>>>>>>>> [ 4377.461344] CIFS: fs/cifs/connect.c: RFC1002 header 0x8=
4
> >> >>>>>>>>>>> [ 4377.461356] CIFS: fs/cifs/smb2ops.c: Decrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4377.461359] CIFS: fs/cifs/smb2ops.c: mid found
> >> >>>>>>>>>>> [ 4377.461361] CIFS: fs/cifs/smb2misc.c: SMB2 data length =
8 offset 72
> >> >>>>>>>>>>> [ 4377.461363] CIFS: fs/cifs/smb2misc.c: SMB2 len 80
> >> >>>>>>>>>>> [ 4377.461366] CIFS: fs/cifs/smb2ops.c: smb2_add_credits: =
added 10
> >> >>>>>>>>>>> credits total=3D290
> >> >>>>>>>>>>> [ 4377.461393] CIFS: fs/cifs/transport.c: cifs_sync_mid_re=
sult: cmd=3D16
> >> >>>>>>>>>>> mid=3D8 state=3D4
> >> >>>>>>>>>>> [ 4377.461399] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4377.461401] CIFS: fs/cifs/smb2pdu.c: Query FSInfo level=
 1
> >> >>>>>>>>>>> [ 4377.461403] CIFS: fs/cifs/transport.c: wait_for_free_cr=
edits:
> >> >>>>>>>>>>> remove 1 credits total=3D289
> >> >>>>>>>>>>> [ 4377.461412] CIFS: fs/cifs/smb2ops.c: Encrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4377.461418] CIFS: fs/cifs/transport.c: Sending smb: smb=
_len=3D161
> >> >>>>>>>>>>> [ 4377.462309] CIFS: fs/cifs/connect.c: RFC1002 header 0x9=
e
> >> >>>>>>>>>>> [ 4377.462322] CIFS: fs/cifs/smb2ops.c: Decrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4377.462324] CIFS: fs/cifs/smb2ops.c: mid found
> >> >>>>>>>>>>> [ 4377.462326] CIFS: fs/cifs/smb2misc.c: SMB2 data length =
34 offset 72
> >> >>>>>>>>>>> [ 4377.462329] CIFS: fs/cifs/smb2misc.c: SMB2 len 106
> >> >>>>>>>>>>> [ 4377.462332] CIFS: fs/cifs/smb2ops.c: smb2_add_credits: =
added 10
> >> >>>>>>>>>>> credits total=3D299
> >> >>>>>>>>>>> [ 4377.462358] CIFS: fs/cifs/transport.c: cifs_sync_mid_re=
sult: cmd=3D16
> >> >>>>>>>>>>> mid=3D9 state=3D4
> >> >>>>>>>>>>> [ 4377.462363] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4377.462366] CIFS: fs/cifs/smb2pdu.c: Query FSInfo level=
 11
> >> >>>>>>>>>>> [ 4377.462376] CIFS: fs/cifs/smb2ops.c: Encrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4377.463243] CIFS: fs/cifs/smb2ops.c: Decrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4377.463248] CIFS: fs/cifs/smb2ops.c: mid found
> >> >>>>>>>>>>> [ 4377.463250] CIFS: fs/cifs/smb2misc.c: SMB2 data length =
28 offset 72
> >> >>>>>>>>>>> [ 4377.463278] CIFS: fs/cifs/misc.c: Null buffer passed to
> >> >>>>>>>>>>> cifs_small_buf_release
> >> >>>>>>>>>>> [ 4377.463283] CIFS: fs/cifs/smb2pdu.c: Close
> >> >>>>>>>>>>> [ 4377.463293] CIFS: fs/cifs/smb2ops.c: Encrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4377.464259] CIFS: fs/cifs/smb2ops.c: Decrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4377.464262] CIFS: fs/cifs/smb2ops.c: mid found
> >> >>>>>>>>>>> [ 4377.464291] CIFS: fs/cifs/dfs_cache.c: cache_refresh_pa=
th: search
> >> >>>>>>>>>>> path: \cheekon\localnet
> >> >>>>>>>>>>> [ 4377.464297] CIFS: fs/cifs/dfs_cache.c: get_dfs_referral=
: get an DFS
> >> >>>>>>>>>>> referral for \cheekon\localnet
> >> >>>>>>>>>>> [ 4377.464299] CIFS: fs/cifs/smb2ops.c: smb2_get_dfs_refer=
: path:
> >> >>>>>>>>>>> \cheekon\localnet
> >> >>>>>>>>>>> [ 4377.464302] CIFS: fs/cifs/smb2pdu.c: SMB2 IOCTL
> >> >>>>>>>>>>> [ 4377.464311] CIFS: fs/cifs/smb2ops.c: Encrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4377.465280] CIFS: fs/cifs/smb2ops.c: Decrypt message re=
turned 0
> >> >>>>>>>>>>> [ 4377.465286] CIFS: fs/cifs/smb2ops.c: mid found
> >> >>>>>>>>>>> [ 4377.465288] CIFS: fs/cifs/smb2misc.c: SMB2 data length =
0 offset 0
> >> >>>>>>>>>>> [ 4377.465322] CIFS: Status code returned 0xc000019c STATU=
S_FS_DRIVER_REQUIRED
> >> >>>>>>>>>>> [ 4377.465336] CIFS: fs/cifs/smb2maperror.c: Mapping SMB2 =
status code
> >> >>>>>>>>>>> 0xc000019c to POSIX err -95
> >> >>>>>>>>>>> [ 4377.465342] CIFS: fs/cifs/connect.c: is_path_remote: fu=
ll_path:
> >> >>>>>>>>>>> [ 4377.465347] CIFS: fs/cifs/smb2pdu.c: create/open
> >> >>>>>>>>>>> [ 4377.466524] CIFS: fs/cifs/smb2pdu.c: Close
> >> >>>>>>>>>>> [ 4377.467607] CIFS: fs/cifs/smb2pdu.c: create/open
> >> >>>>>>>>>>> [ 4377.468787] CIFS: fs/cifs/smb2pdu.c: Close
> >> >>>>>>>>>>> [ 4377.469850] CIFS: fs/cifs/connect.c: VFS: leaving cifs_=
mount (xid =3D
> >> >>>>>>>>>>> 646) rc =3D 0
> >> >>>>>>>>>>> [ 4377.469856] CIFS: fs/cifs/sess.c: ses already at max_ch=
annels (1),
> >> >>>>>>>>>>> nothing to open
> >> >>>>>>>>>>> [ 4377.470004] CIFS: fs/cifs/inode.c: VFS: in cifs_root_ig=
et as Xid:
> >> >>>>>>>>>>> 650 with uid: 0
> >> >>>>>>>>>>> [ 4377.471323] CIFS: fs/cifs/smb2misc.c: Calculated size 2=
08 length
> >> >>>>>>>>>>> 512 mismatch mid 17
> >> >>>>>>>>>>> [ 4377.471344] CIFS: fs/cifs/smb2misc.c: Calculated size 1=
74 length
> >> >>>>>>>>>>> 512 mismatch mid 18
> >> >>>>>>>>>>> [ 4377.471347] CIFS: fs/cifs/smb2misc.c: Calculated size 1=
24 length
> >> >>>>>>>>>>> 512 mismatch mid 19
> >> >>>>>>>>>>> [ 4377.471395] CIFS: fs/cifs/smb2ops.c: get smb3 acl for p=
ath
> >> >>>>>>>>>>> [ 4377.471403] CIFS: fs/cifs/smb2ops.c: VFS: in get_smb2_a=
cl_by_path
> >> >>>>>>>>>>> as Xid: 651 with uid: 0
> >> >>>>>>>>>>> [ 4377.471409] CIFS: fs/cifs/smb2pdu.c: create/open
> >> >>>>>>>>>>> [ 4377.472632] CIFS: fs/cifs/smb2pdu.c: Query Info
> >> >>>>>>>>>>> [ 4377.473671] CIFS: fs/cifs/smb2pdu.c: Close
> >> >>>>>>>>>>> [ 4377.474729] CIFS: fs/cifs/smb2ops.c: VFS: leaving
> >> >>>>>>>>>>> get_smb2_acl_by_path (xid =3D 651) rc =3D 0
> >> >>>>>>>>>>> [ 4377.474733] CIFS: fs/cifs/smb2ops.c: get_smb2_acl_by_pa=
th: rc =3D 0 ACL len 312
> >> >>>>>>>>>>> [ 4377.477086] CIFS: fs/cifs/cifsacl.c: sid_to_id: Can't m=
ap SID
> >> >>>>>>>>>>> os:S-1-5-21-122774138-3582407017-3610500266-1001 to a uid
> >> >>>>>>>>>>> [ 4377.478800] CIFS: fs/cifs/cifsacl.c: sid_to_id: Can't m=
ap SID
> >> >>>>>>>>>>> gs:S-1-22-2-1001 to a gid
> >> >>>>>>>>>>> [ 4377.478809] CIFS: fs/cifs/inode.c: looking for uniqueid=
=3D263248
> >> >>>>>>>>>>> [ 4377.478821] CIFS: fs/cifs/inode.c: cifs_revalidate_cach=
e:
> >> >>>>>>>>>>> revalidating inode 263248
> >> >>>>>>>>>>> [ 4377.478823] CIFS: fs/cifs/inode.c: cifs_revalidate_cach=
e: inode 263248 is new
> >> >>>>>>>>>>> [ 4377.478826] CIFS: fs/cifs/inode.c: VFS: leaving cifs_ro=
ot_iget (xid
> >> >>>>>>>>>>> =3D 650) rc =3D 0
> >> >>>>>>>>>>> [ 4377.478830] CIFS: fs/cifs/cifsfs.c: Get root dentry for
> >> >>>>>>>>>>> [ 4377.478832] CIFS: fs/cifs/cifsfs.c: dentry root is: 000=
0000095b05357
> >> >>>>>>>>>>> [ 4377.480027] CIFS: fs/cifs/dir.c: VFS: in cifs_lookup as=
 Xid: 652
> >> >>>>>>>>>>> with uid: 1000
> >> >>>>>>>>>>> [ 4377.480033] CIFS: fs/cifs/dir.c: parent inode =3D 0x000=
00000cc8fcd81
> >> >>>>>>>>>>> name is: .Trash and dentry =3D 0x000000001bf85909
> >> >>>>>>>>>>> [ 4377.480039] CIFS: fs/cifs/dir.c: NULL inode in lookup
> >> >>>>>>>>>>> [ 4377.480041] CIFS: fs/cifs/dir.c: Full path: \.Trash ino=
de =3D
> >> >>>>>>>>>>> 0x0000000000000000
> >> >>>>>>>>>>> [ 4377.481529] CIFS: fs/cifs/cifsfs.c: VFS: in cifs_statfs=
 as Xid: 653
> >> >>>>>>>>>>> with uid: 1000
> >> >>>>>>>>>>> [ 4377.481861] CIFS: fs/cifs/smb2misc.c: Calculated size 7=
3 length 240
> >> >>>>>>>>>>> mismatch mid 23
> >> >>>>>>>>>>> [ 4377.481867] CIFS: fs/cifs/smb2misc.c: Calculated size 7=
3 length 240
> >> >>>>>>>>>>> mismatch mid 24
> >> >>>>>>>>>>> [ 4377.481870] CIFS: fs/cifs/smb2misc.c: Calculated size 7=
3 length 240
> >> >>>>>>>>>>> mismatch mid 25
> >> >>>>>>>>>>> [ 4377.481885] CIFS: Status code returned 0xc0000034
> >> >>>>>>>>>>> STATUS_OBJECT_NAME_NOT_FOUND
> >> >>>>>>>>>>> [ 4377.481893] CIFS: fs/cifs/smb2maperror.c: Mapping SMB2 =
status code
> >> >>>>>>>>>>> 0xc0000034 to POSIX err -2
> >> >>>>>>>>>>> [ 4377.481901] CIFS: fs/cifs/inode.c: cifs_get_inode_info:=
 unhandled err rc -2
> >> >>>>>>>>>>> [ 4377.481905] CIFS: fs/cifs/dir.c: VFS: leaving cifs_look=
up (xid =3D 652) rc =3D -2
> >> >>>>>>>>>>> [ 4377.481957] CIFS: fs/cifs/dir.c: VFS: in cifs_lookup as=
 Xid: 654
> >> >>>>>>>>>>> with uid: 1000
> >> >>>>>>>>>>> [ 4377.481960] CIFS: fs/cifs/dir.c: parent inode =3D 0x000=
00000cc8fcd81
> >> >>>>>>>>>>> name is: .Trash-1000 and dentry =3D 0x000000007d3b3552
> >> >>>>>>>>>>> [ 4377.481966] CIFS: fs/cifs/dir.c: NULL inode in lookup
> >> >>>>>>>>>>> [ 4377.481967] CIFS: fs/cifs/dir.c: Full path: \.Trash-100=
0 inode =3D
> >> >>>>>>>>>>> 0x0000000000000000
> >> >>>>>>>>>>> [ 4377.483453] CIFS: fs/cifs/smb2misc.c: Calculated size 2=
08 length
> >> >>>>>>>>>>> 440 mismatch mid 26
> >> >>>>>>>>>>> [ 4377.483463] CIFS: fs/cifs/smb2misc.c: Calculated size 1=
04 length
> >> >>>>>>>>>>> 440 mismatch mid 27
> >> >>>>>>>>>>> [ 4377.483466] CIFS: fs/cifs/smb2misc.c: Calculated size 1=
24 length
> >> >>>>>>>>>>> 440 mismatch mid 28
> >> >>>>>>>>>>> [ 4377.483491] CIFS: fs/cifs/cifsfs.c: VFS: leaving cifs_s=
tatfs (xid =3D
> >> >>>>>>>>>>> 653) rc =3D 0
> >> >>>>>>>>>>> [ 4377.484901] CIFS: Status code returned 0xc0000034
> >> >>>>>>>>>>> STATUS_OBJECT_NAME_NOT_FOUND
> >> >>>>>>>>>>> [ 4377.484908] CIFS: fs/cifs/smb2maperror.c: Mapping SMB2 =
status code
> >> >>>>>>>>>>> 0xc0000034 to POSIX err -2
> >> >>>>>>>>>>> [ 4377.484913] CIFS: fs/cifs/inode.c: cifs_get_inode_info:=
 unhandled err rc -2
> >> >>>>>>>>>>> [ 4377.484916] CIFS: fs/cifs/dir.c: VFS: leaving cifs_look=
up (xid =3D 654) rc =3D -2
> >> >>>>>>>>>>>
> >> >>>>>>>>>>>
> >> >>>>>>>>>>>
> >> >>>>>>>>>>> On Fri, Mar 4, 2022 at 9:01 AM Satadru Pramanik <satadru@g=
mail.com> wrote:
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>> Here is a subset of the recent dmesg during failed mounts=
, followed by
> >> >>>>>>>>>>>> an unmount and remount.
> >> >>>>>>>>>>>>
> >> >>>>>>>>>>>> On Fri, Mar 4, 2022 at 8:58 AM Satadru Pramanik <satadru@=
gmail.com> wrote:
> >> >>>>>>>>>>>>>
> >> >>>>>>>>>>>>> I have put this in my /etc/rc.local:
> >> >>>>>>>>>>>>> echo 'module cifs +p' > /sys/kernel/debug/dynamic_debug/=
control
> >> >>>>>>>>>>>>> echo 'file fs/cifs/* +p' > /sys/kernel/debug/dynamic_deb=
ug/control
> >> >>>>>>>>>>>>> echo 7 > /proc/fs/cifs/cifsFYI
> >> >>>>>>>>>>>>>
> >> >>>>>>>>>>>>> I ran the commands again manually, and the attached dmes=
g appears to
> >> >>>>>>>>>>>>> be capturing some of the aforementioned reconnection eff=
orts this
> >> >>>>>>>>>>>>> morning.
> >> >>>>>>>>>>>>>
> >> >>>>>>>>>>>>> On Fri, Mar 4, 2022 at 12:49 AM Shyam Prasad N <nspmanga=
lore@gmail.com> wrote:
> >> >>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>> On Wed, Mar 2, 2022 at 8:16 PM Satadru Pramanik <satadr=
u@gmail.com> wrote:
> >> >>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>> Here is also the dmesg as promised. (After resuming fr=
om suspend/sleep
> >> >>>>>>>>>>>>>>> this morning, when I again had the same issue.)
> >> >>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>> On Wed, Mar 2, 2022 at 2:57 AM Shyam Prasad N <nspmang=
alore@gmail.com> wrote:
> >> >>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>> On Wed, Mar 2, 2022 at 3:51 AM Satadru Pramanik <sata=
dru@gmail.com> wrote:
> >> >>>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>>> I have put the trace.dat and other debug files here =
since I can not
> >> >>>>>>>>>>>>>>>>> attach the files to a message to the list. (Apparent=
ly the trace.dat
> >> >>>>>>>>>>>>>>>>> file is too large.)
> >> >>>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>>> https://drive.google.com/drive/folders/1wEi968RbXxiv=
XMMH8J7XUsHhrxu9OWDX?usp=3Dsharing
> >> >>>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>>> On Mon, Feb 28, 2022 at 11:12 PM Satadru Pramanik <s=
atadru@gmail.com> wrote:
> >> >>>>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>>>> The trace.dat file is attached, covering the period=
 before suspend,
> >> >>>>>>>>>>>>>>>>>> and through wake several hours later, when the moun=
t no longer worked,
> >> >>>>>>>>>>>>>>>>>> and showed the CIFS: VFS: cifs_tree_connect: could =
not find
> >> >>>>>>>>>>>>>>>>>> superblock: -22 message, and through when I unmount=
ed and remounted
> >> >>>>>>>>>>>>>>>>>> the share, which then started working.
> >> >>>>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>>>> On Mon, Feb 28, 2022 at 9:31 AM Satadru Pramanik <s=
atadru@gmail.com> wrote:
> >> >>>>>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>>>>> Here is the DebugData from before and after from t=
he system with the
> >> >>>>>>>>>>>>>>>>>>> failed mount.
> >> >>>>>>>>>>>>>>>>>>> Both systems are now running 5.17-rc6.
> >> >>>>>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>>>>> Working on the trace-cmd now.
> >> >>>>>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>>>>> On Sun, Feb 27, 2022 at 9:37 PM Steve French <smfr=
ench@gmail.com> wrote:
> >> >>>>>>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>>>>>> I would like to see the output of:
> >> >>>>>>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>>>>>> /proc/fs/cifs/DebugData before and after the fail=
ure if possible.
> >> >>>>>>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>>>>>> In addition, there would be some value in seeing =
trace information
> >> >>>>>>>>>>>>>>>>>>>> (e.g start tracing by
> >> >>>>>>>>>>>>>>>>>>>> "trace-cmd record -e cifs" before the failure and=
 then forward the
> >> >>>>>>>>>>>>>>>>>>>> debug information displayed by "trace-cmd show" a=
fter the failure)
> >> >>>>>>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>>>>>> On Sun, Feb 27, 2022 at 7:55 AM Thorsten Leemhuis
> >> >>>>>>>>>>>>>>>>>>>> <regressions@leemhuis.info> wrote:
> >> >>>>>>>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>>>>>>> [TLDR: I'm adding the regression report below to=
 regzbot, the Linux
> >> >>>>>>>>>>>>>>>>>>>>> kernel regression tracking bot; all text you fin=
d below is compiled from
> >> >>>>>>>>>>>>>>>>>>>>> a few templates paragraphs you might have encoun=
tered already already
> >> >>>>>>>>>>>>>>>>>>>>> from similar mails.]
> >> >>>>>>>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>>>>>>> Hi, this is your Linux kernel regression tracker=
. Top-posting for once,
> >> >>>>>>>>>>>>>>>>>>>>> to make this easily accessible to everyone.
> >> >>>>>>>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>>>>>>> CCing the regression mailing list, as it should =
be in the loop for all
> >> >>>>>>>>>>>>>>>>>>>>> regressions, as explained here:
> >> >>>>>>>>>>>>>>>>>>>>> https://www.kernel.org/doc/html/latest/admin-gui=
de/reporting-issues.html
> >> >>>>>>>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>>>>>>> To be sure below issue doesn't fall through the =
cracks unnoticed, I'm
> >> >>>>>>>>>>>>>>>>>>>>> adding it to regzbot, my Linux kernel regression=
 tracking bot:
> >> >>>>>>>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>>>>>>> #regzbot ^introduced v5.16.11..v5.17-rc5
> >> >>>>>>>>>>>>>>>>>>>>> #regzbot title cifs: Failure to access cifs moun=
t of samba share after
> >> >>>>>>>>>>>>>>>>>>>>> resume from sleep
> >> >>>>>>>>>>>>>>>>>>>>> #regzbot ignore-activity
> >> >>>>>>>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>>>>>>> Reminder for developers: when fixing the issue, =
please add a 'Link:'
> >> >>>>>>>>>>>>>>>>>>>>> tags pointing to the report (the mail quoted abo=
ve) using
> >> >>>>>>>>>>>>>>>>>>>>> lore.kernel.org/r/, as explained in
> >> >>>>>>>>>>>>>>>>>>>>> 'Documentation/process/submitting-patches.rst' a=
nd
> >> >>>>>>>>>>>>>>>>>>>>> 'Documentation/process/5.Posting.rst'. This allo=
ws the bot to connect
> >> >>>>>>>>>>>>>>>>>>>>> the report with any patches posted or committed =
to fix the issue; this
> >> >>>>>>>>>>>>>>>>>>>>> again allows the bot to show the current status =
of regressions and
> >> >>>>>>>>>>>>>>>>>>>>> automatically resolve the issue when the fix hit=
s the right tree.
> >> >>>>>>>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>>>>>>> I'm sending this to everyone that got the initia=
l report, to make them
> >> >>>>>>>>>>>>>>>>>>>>> aware of the tracking. I also hope that messages=
 like this motivate
> >> >>>>>>>>>>>>>>>>>>>>> people to directly get at least the regression m=
ailing list and ideally
> >> >>>>>>>>>>>>>>>>>>>>> even regzbot involved when dealing with regressi=
ons, as messages like
> >> >>>>>>>>>>>>>>>>>>>>> this wouldn't be needed then. And don't worry, i=
f I need to send other
> >> >>>>>>>>>>>>>>>>>>>>> mails regarding this regression only relevant fo=
r regzbot I'll send them
> >> >>>>>>>>>>>>>>>>>>>>> to the regressions lists only (with a tag in the=
 subject so people can
> >> >>>>>>>>>>>>>>>>>>>>> filter them away). With a bit of luck no such me=
ssages will be needed
> >> >>>>>>>>>>>>>>>>>>>>> anyway.
> >> >>>>>>>>>>>>>>>>>>>>>
> >> >>>>>>>>>>>>>>>>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's =
regression tracker' hat)
> >> >
> >> >
> >> >
>
>
>
> --
> Regards,
> Shyam

--00000000000057e06705dc9ec266
Content-Type: application/gzip; name="dmesg.manualmount.txt.gz"
Content-Disposition: attachment; filename="dmesg.manualmount.txt.gz"
Content-Transfer-Encoding: base64
Content-ID: <f_l1z578qg0>
X-Attachment-Id: f_l1z578qg0

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
--00000000000057e06705dc9ec266--
