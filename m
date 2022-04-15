Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACCF7E
	for <regressions@lists.linux.dev>; Fri, 15 Apr 2022 00:26:32 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id z139so527873vsz.0
        for <regressions@lists.linux.dev>; Thu, 14 Apr 2022 17:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=STdvYHbA2AtJODEMsA65aUV/C+Trj+WxDULYmsFGt08=;
        b=EOdaitE2kmvKuNK0EWznCl6TqXcUYRnxsES9t5Ep3FkHyTuoKLwoufZ2xh/snWBo5m
         00MPJHPRqHj5X2HbvN7IIXrtM46Dii6BVOWIsA1YQ8/fGwsTExdjVutNzWOjYkPddHNe
         ddymJ8iBBRVAF7f8PVUv7SVF10TKJNI3HYEKAVaYMVk1K0nwXsjSuP7qbjczGGJkI8l2
         RWd9b2T8HT44b9cri8kzSLqnQ+Td2xW+tp9rJmpv5PjZGOtsOF8RQ6iO9JVQUB2Pv2hp
         W3lgQHZBnz78CDM4PTBQFYH//1Uhf1wLmlFmIo1tdtPchkNIG7qZ1q/zP4ufaEacKAuE
         4H5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=STdvYHbA2AtJODEMsA65aUV/C+Trj+WxDULYmsFGt08=;
        b=WCPwaNSA2ZSbv9hfAbsy/3lQMn1jehlWSy6CpisLkB8dybXxCvt4HdsF8atItYDs2f
         lfTI5GQu9xUyip2mgXR+By21OLO4Fs2F5fo0G0+ubkURJXrq7gDAQB3a3NDql5Ag/Nmp
         y3q2XYKuAwCfRColvsbg93UfJdQ6N8Qv3S8ARV4wnjomV/Hu75INXH+HxqyM7QhE/VDD
         JAhi/x9C1T3sXCU0YbTVPeXprjpABR0+DRb4cXipICKWXrzRLNke68EFVup48IqvXWXX
         mBo+Jpt5INrSO/T/Hjbe81yGLpQnh81RejLe38hNKwEv5GxN2w8l4IBQc1Yb3QWalFVH
         cr/A==
X-Gm-Message-State: AOAM533MvoGx3XL0kZMx1ew6Qec33BF6AABztnLRnR8NpJ3H8/d54hTc
	xBGklkPn464kI2Y2sVHV+zo+BoYyGqXVt4vzdjs=
X-Google-Smtp-Source: ABdhPJyfJkBJhljm4RONIpessvpcVY0i5g/YA9zrbZHal8gtCXdOJsajATJMJObtgdM+gzv+BSseMi+LS8ZB2hTXLeg=
X-Received: by 2002:a05:6102:3347:b0:328:532c:6e36 with SMTP id
 j7-20020a056102334700b00328532c6e36mr2327932vse.6.1649982390673; Thu, 14 Apr
 2022 17:26:30 -0700 (PDT)
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
 <CAFrh3J8nNfbxS86bHa7bsSo5eT3nD=jALTCVQcyqCepGQYYGaQ@mail.gmail.com> <CAH2r5mvTLp9F3OEd0wYt6NcVBqSUE_LJt1iQO1=qbZP0_dH5Qw@mail.gmail.com>
In-Reply-To: <CAH2r5mvTLp9F3OEd0wYt6NcVBqSUE_LJt1iQO1=qbZP0_dH5Qw@mail.gmail.com>
From: Satadru Pramanik <satadru@gmail.com>
Date: Thu, 14 Apr 2022 20:26:17 -0400
Message-ID: <CAFrh3J-ZTS-epH9VU7EyWfpF00AMXf_AFV5YFWtzt=8TnQiO1w@mail.gmail.com>
Subject: Re: Failure to access cifs mount of samba share after resume from
 sleep with 5.17-rc5
To: Steve French <smfrench@gmail.com>
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	ronnie sahlberg <ronniesahlberg@gmail.com>, CIFS <linux-cifs@vger.kernel.org>, 
	regressions@lists.linux.dev
Content-Type: multipart/mixed; boundary="00000000000048928905dca676b7"

--00000000000048928905dca676b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here is a dmesg from doing a moprobe cifs first before manually
mounting a cifs server at a numeric IP.
Regards,
Satadru

On Thu, Apr 14, 2022 at 12:08 PM Steve French <smfrench@gmail.com> wrote:
>
> You can do "modprobe cifs" (or insmod ...) and then do the "echo >
> /proc/fs/cifs/...").  The module must be loaded either explicitly or
> implicitly (by mount -t cifs e.g.) before the pseudofiles are created.
>
> On Thu, Apr 14, 2022 at 10:15 AM Satadru Pramanik <satadru@gmail.com> wro=
te:
> >
> > FYI I can not switch on cifsFYI before doing the initial mount.
> >
> > I get this error:
> > echo 7 > /proc/fs/cifs/cifsFYI
> > bash: /proc/fs/cifs/cifsFYI: No such file or directory
> >
> > So I mounted, enabled cifsFYI, unmounted, remounted the cifs volume
> > manually, put the laptop to sleep, rebooted the server, and then got
> > the error.
> >
> > The dmesg is attached.
> >
> > Regards,
> > Satadru
> >
> > On Wed, Apr 13, 2022 at 11:48 PM Shyam Prasad N <nspmangalore@gmail.com=
> wrote:
> > >
> > > Hi Satadru,
> > >
> > > Can you please send the full cifsFYI logs with manual mount? Please
> > > switch on cifsFYI before you mount the share.
> > >
> > > On Tue, Apr 12, 2022 at 1:40 AM Satadru Pramanik <satadru@gmail.com> =
wrote:
> > > >
> > > > Both tests resulted in similar failures (removing the mount from fs=
tab and switching the mount to an IP address vs a hostname.)
> > > >
> > > > I'll compile 5.18-rc2 and see if I have the same issues.
> > > >
> > > > On Mon, Apr 11, 2022 at 6:29 AM Thorsten Leemhuis <regressions@leem=
huis.info> wrote:
> > > >>
> > > >> Hi, this is your Linux kernel regression tracker. Top-posting for =
once,
> > > >> to make this easily accessible to everyone.
> > > >>
> > > >> What's the status here?
> > > >>
> > > >> Satadru, did you do the tests?
> > > >>
> > > >> Shyam: or where you or somebody else able to address this aleady?
> > > >>
> > > >> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker=
' hat)
> > > >>
> > > >> P.S.: As the Linux kernel's regression tracker I'm getting a lot o=
f
> > > >> reports on my table. I can only look briefly into most of them and=
 lack
> > > >> knowledge about most of the areas they concern. I thus unfortunate=
ly
> > > >> will sometimes get things wrong or miss something important. I hop=
e
> > > >> that's not the case here; if you think it is, don't hesitate to te=
ll me
> > > >> in a public reply, it's in everyone's interest to set the public r=
ecord
> > > >> straight.
> > > >>
> > > >> #regzbot poke
> > > >>
> > > >> On 18.03.22 15:05, Shyam Prasad N wrote:
> > > >> > Thanks for the update. No worries.
> > > >> >
> > > >> > On Fri, Mar 18, 2022 at 7:30 PM Satadru Pramanik <satadru@gmail.=
com> wrote:
> > > >> >>
> > > >> >> I can do those tests on March 27th when I return to my setup in=
 NY. The hostname "cheekon" is indeed resolved either locally to a RFC1918 =
address via the LAN DNS server or to an IPv6 address via other DNS servers,=
 assuming the host has picked up the domain search suffix via DHCP. The lap=
top is running the stock Ubuntu 22.04 DNS resolution setup, which I believe=
 is systemd-resolved.
> > > >> >>
> > > >> >> I apologize for being unable to help troubleshoot this issue ag=
ain before I get back, as I am on a trip with family, and did not lug the U=
buntu laptop (and server) with me.
> > > >> >>
> > > >> >> Regards,
> > > >> >> Satadru
> > > >> >>
> > > >> >> On Fri, Mar 18, 2022, 4:05 AM Shyam Prasad N <nspmangalore@gmai=
l.com> wrote:
> > > >> >>>
> > > >> >>> Hi Satadru,
> > > >> >>>
> > > >> >>> For the sleep/resume issue:
> > > >> >>> After going through the logs in detail, I could see that cifs.=
ko is
> > > >> >>> mostly behaving the way it should be. I could see that a recon=
nect was
> > > >> >>> triggered, and that also worked fine for the most part.
> > > >> >>> The only issue is that the superblock is missing. I'm trying t=
o
> > > >> >>> understand what led to that.
> > > >> >>>
> > > >> >>> You mentioned that you have the mount setup as an fstab entry.=
 If it
> > > >> >>> is possible, can you repeat the same experiment with this entr=
y
> > > >> >>> removed from fstab.
> > > >> >>> Also as another experiment, can you replace the hostname (chee=
kon)
> > > >> >>> with the corresponding IP address and repeat the same experime=
nt. (I
> > > >> >>> could see "failed to resolve hostname" logs from some of your =
earlier
> > > >> >>> logs after resume).
> > > >> >>>
> > > >> >>> I have a feeling that one of these two factors is exposing thi=
s bug in cifs.ko.
> > > >> >>>
> > > >> >>> For the samba server restart issue, I could see from the logs =
that you
> > > >> >>> pasted that your I/O process was pending a signal. This was th=
e reason
> > > >> >>> that the I/O kept returning errno 512 (ERESTARTSYS).
> > > >> >>>
> > > >> >>> Hi Thorsten,
> > > >> >>> Based on my investigations above, I believe that the way Satad=
ru's
> > > >> >>> laptop is setup has exposed a bug that we're finding it hard t=
o
> > > >> >>> reproduce.
> > > >> >>> I think that the above experiments that I suggested will help =
narrow
> > > >> >>> down the problem and take us closer to root causing the issue.
> > > >> >>>
> > > >> >>> Regards,
> > > >> >>> Shyam
> > > >> >>>
> > > >> >>> On Wed, Mar 16, 2022 at 10:57 PM Satadru Pramanik <satadru@gma=
il.com> wrote:
> > > >> >>>>
> > > >> >>>> I am unable to mount a cifs volume with that patch reversed.
> > > >> >>>> This is what dmesg shows:
> > > >> >>>> [  242.560881] INFO: task mount.smb3:3219 blocked for more th=
an 120 seconds.
> > > >> >>>> [  242.560901]       Tainted: P           OE
> > > >> >>>> 5.17.0-051700rc8-generic #202203132130
> > > >> >>>> [  242.560904] "echo 0 > /proc/sys/kernel/hung_task_timeout_s=
ecs"
> > > >> >>>> disables this message.
> > > >> >>>> [  242.560907] task:mount.smb3      state:D stack:    0 pid: =
3219
> > > >> >>>> ppid:     1 flags:0x00004006
> > > >> >>>> [  242.560914] Call Trace:
> > > >> >>>> [  242.560918]  <TASK>
> > > >> >>>> [  242.560927]  __schedule+0x240/0x5a0
> > > >> >>>> [  242.560939]  schedule+0x55/0xd0
> > > >> >>>> [  242.560941]  schedule_preempt_disabled+0x15/0x20
> > > >> >>>> [  242.560944]  __mutex_lock.constprop.0+0x2e0/0x4b0
> > > >> >>>> [  242.560949]  __mutex_lock_slowpath+0x13/0x20
> > > >> >>>> [  242.560953]  mutex_lock+0x34/0x40
> > > >> >>>> [  242.560958]  cifs_get_smb_ses+0x367/0xab0 [cifs]
> > > >> >>>> [  242.561108]  ? __queue_delayed_work+0x5c/0x90
> > > >> >>>> [  242.561120]  mount_get_conns+0x63/0x430 [cifs]
> > > >> >>>> [  242.561182]  cifs_mount+0x86/0x420 [cifs]
> > > >> >>>> [  242.561222]  cifs_smb3_do_mount+0x10d/0x320 [cifs]
> > > >> >>>> [  242.561252]  ? cifs_smb3_do_mount+0x10d/0x320 [cifs]
> > > >> >>>> [  242.561283]  ? vfs_parse_fs_string+0x7f/0xb0
> > > >> >>>> [  242.561290]  smb3_get_tree+0x3e/0x70 [cifs]
> > > >> >>>> [  242.561337]  vfs_get_tree+0x27/0xc0
> > > >> >>>> [  242.561343]  do_new_mount+0x14b/0x1a0
> > > >> >>>> [  242.561348]  path_mount+0x1d4/0x530
> > > >> >>>> [  242.561350]  ? putname+0x55/0x60
> > > >> >>>> [  242.561357]  __x64_sys_mount+0x108/0x140
> > > >> >>>> [  242.561360]  do_syscall_64+0x59/0xc0
> > > >> >>>> [  242.561368]  ? do_syscall_64+0x69/0xc0
> > > >> >>>> [  242.561372]  ? handle_mm_fault+0xba/0x290
> > > >> >>>> [  242.561376]  ? do_user_addr_fault+0x1dd/0x670
> > > >> >>>> [  242.561382]  ? syscall_exit_to_user_mode+0x27/0x50
> > > >> >>>> [  242.561385]  ? exit_to_user_mode_prepare+0x37/0xb0
> > > >> >>>> [  242.561392]  ? irqentry_exit_to_user_mode+0x9/0x20
> > > >> >>>> [  242.561394]  ? irqentry_exit+0x33/0x40
> > > >> >>>> [  242.561397]  ? exc_page_fault+0x89/0x180
> > > >> >>>> [  242.561399]  ? asm_exc_page_fault+0x8/0x30
> > > >> >>>> [  242.561405]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > > >> >>>> [  242.561409] RIP: 0033:0x7f42af11ceae
> > > >> >>>> [  242.561414] RSP: 002b:00007fff6af66c48 EFLAGS: 00000206 OR=
IG_RAX:
> > > >> >>>> 00000000000000a5
> > > >> >>>> [  242.561418] RAX: ffffffffffffffda RBX: 000055dcbe40beb0 RC=
X: 00007f42af11ceae
> > > >> >>>> [  242.561420] RDX: 000055dcbe1a447e RSI: 000055dcbe1a44da RD=
I: 00007fff6af67ea6
> > > >> >>>> [  242.561421] RBP: 0000000000000000 R08: 000055dcbe40beb0 R0=
9: 000055dcbe40cf40
> > > >> >>>> [  242.561423] R10: 0000000000000000 R11: 0000000000000206 R1=
2: 00007fff6af67e9b
> > > >> >>>> [  242.561424] R13: 00007f42af237000 R14: 00007f42af23990f R1=
5: 000055dcbe40cf40
> > > >> >>>> [  242.561427]  </TASK>
> > > >> >>>>
> > > >> >>>> On Wed, Mar 16, 2022 at 9:22 AM Satadru Pramanik <satadru@gma=
il.com> wrote:
> > > >> >>>>>
> > > >> >>>>> I will try that.
> > > >> >>>>>
> > > >> >>>>> On Wed, Mar 16, 2022 at 1:27 AM ronnie sahlberg
> > > >> >>>>> <ronniesahlberg@gmail.com> wrote:
> > > >> >>>>>>
> > > >> >>>>>> I have analyzed the patch Steve bisected and we have figure=
d out why
> > > >> >>>>>> it breaks multiuser mounts.
> > > >> >>>>>> (It basically assumes there is a 1-to-1 correlation between=
 two
> > > >> >>>>>> structures in the kernel while for multiuser it is actually=
 a 1-n and
> > > >> >>>>>> we tracked important state information for 'n' in the '1' s=
tructure
> > > >> >>>>>> :-( )
> > > >> >>>>>>
> > > >> >>>>>> But now that we understand how that patch broke multiuser I=
 am not
> > > >> >>>>>> certain it is also responsible for breaking suspend.
> > > >> >>>>>> Satadru, can you try to compile a kernel without this patch=
 and see if
> > > >> >>>>>> it fixes your issue?
> > > >> >>>>>>
> > > >> >>>>>> On Wed, Mar 16, 2022 at 12:25 PM Steve French <smfrench@gma=
il.com> wrote:
> > > >> >>>>>>>
> > > >> >>>>>>> Fix shouldn't be hard but agree with Ronnie's points about=
 adding those tests to the buildbot
> > > >> >>>>>>>
> > > >> >>>>>>> On Tue, Mar 15, 2022, 21:15 ronnie sahlberg <ronniesahlber=
g@gmail.com> wrote:
> > > >> >>>>>>>>
> > > >> >>>>>>>> I can confirm that patch is what broke multiuser mounts t=
oo.
> > > >> >>>>>>>> Now the question is why the buildbot did not catch this. =
 I remember
> > > >> >>>>>>>> adding a test that basic multiuser worked long time ago.
> > > >> >>>>>>>>
> > > >> >>>>>>>> I would suggest, once the code is fixed or reverted,
> > > >> >>>>>>>> We need someone to look at why the buildbot did not detec=
t that
> > > >> >>>>>>>> multiuser was broken.
> > > >> >>>>>>>> We should also add tests in buildbot for a simple suspend=
/resume cycle
> > > >> >>>>>>>> which should be possible to do using simple virsh command=
s.
> > > >> >>>>>>>>
> > > >> >>>>>>>>
> > > >> >>>>>>>>
> > > >> >>>>>>>> On Wed, Mar 16, 2022 at 8:47 AM Steve French <smfrench@gm=
ail.com> wrote:
> > > >> >>>>>>>>>
> > > >> >>>>>>>>> We have bisected a regression (may be related) that was =
reproducible
> > > >> >>>>>>>>> (we had difficulty reproducing Satadru's scenario) and a=
ffects a
> > > >> >>>>>>>>> similar area so are focused on that.  We bisected that r=
egression down
> > > >> >>>>>>>>> to this commit added early in 5.17-rc. Adding Ronnie on =
cc because he
> > > >> >>>>>>>>> had noticed the easier to repro scenario. Still debuggin=
g.
> > > >> >>>>>>>>>
> > > >> >>>>>>>>> commit 73f9bfbe3d818bb52266d5c9f3ba57d97842ffe7 (HEAD ->=
 tmp)
> > > >> >>>>>>>>> Author: Shyam Prasad N <sprasad@microsoft.com>
> > > >> >>>>>>>>> Date:   Mon Jul 19 17:37:52 2021 +0000
> > > >> >>>>>>>>>
> > > >> >>>>>>>>>     cifs: maintain a state machine for tcp/smb/tcon sess=
ions
> > > >> >>>>>>>>>
> > > >> >>>>>>>>>     If functions like cifs_negotiate_protocol, cifs_setu=
p_session,
> > > >> >>>>>>>>>     cifs_tree_connect are called in parallel on differen=
t channels,
> > > >> >>>>>>>>>     each of these will be execute the requests. This may=
be unnecessary
> > > >> >>>>>>>>>     in some cases, and only the first caller may need to=
 do the work.
> > > >> >>>>>>>>>
> > > >> >>>>>>>>>     This is achieved by having more states for the tcp/s=
mb/tcon session
> > > >> >>>>>>>>>     status fields. And tracking the state of reconnectio=
n based on the
> > > >> >>>>>>>>>     state machine.
> > > >> >>>>>>>>>
> > > >> >>>>>>>>>     For example:
> > > >> >>>>>>>>>     for tcp connections:
> > > >> >>>>>>>>>     CifsNew/CifsNeedReconnect ->
> > > >> >>>>>>>>>       CifsNeedNegotiate ->
> > > >> >>>>>>>>>         CifsInNegotiate ->
> > > >> >>>>>>>>>           CifsNeedSessSetup ->
> > > >> >>>>>>>>>             CifsInSessSetup ->
> > > >> >>>>>>>>>               CifsGood
> > > >> >>>>>>>>>
> > > >> >>>>>>>>>     for smb sessions:
> > > >> >>>>>>>>>     CifsNew/CifsNeedReconnect ->
> > > >> >>>>>>>>>       CifsGood
> > > >> >>>>>>>>>
> > > >> >>>>>>>>> On Tue, Mar 15, 2022 at 8:26 AM Thorsten Leemhuis
> > > >> >>>>>>>>> <regressions@leemhuis.info> wrote:
> > > >> >>>>>>>>>>
> > > >> >>>>>>>>>> Hi, this is your Linux kernel regression tracker. Top-p=
osting for once,
> > > >> >>>>>>>>>> to make this easily accessible to everyone.
> > > >> >>>>>>>>>>
> > > >> >>>>>>>>>> Steve, Shyam, what's up here? Satadru prodided lot's of=
 data already
> > > >> >>>>>>>>>> last week and wrote below message 24h ago, but I haven'=
t seen anything
> > > >> >>>>>>>>>> about this from your side for more than ten days now. O=
r is the issue
> > > >> >>>>>>>>>> (or even a fix?) discussed somewhere else and I just mi=
ssed it?
> > > >> >>>>>>>>>>
> > > >> >>>>>>>>>> Just asking, because thx to rc8 there is still a chance=
 to get this
> > > >> >>>>>>>>>> fixed before the final release happens.
> > > >> >>>>>>>>>>
> > > >> >>>>>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regress=
ion tracker' hat)
> > > >> >>>>>>>>>>
> > > >> >>>>>>>>>> P.S.: As the Linux kernel's regression tracker I'm gett=
ing a lot of
> > > >> >>>>>>>>>> reports on my table. I can only look briefly into most =
of them and lack
> > > >> >>>>>>>>>> knowledge about most of the areas they concern. I thus =
unfortunately
> > > >> >>>>>>>>>> will sometimes get things wrong or miss something impor=
tant. I hope
> > > >> >>>>>>>>>> that's not the case here; if you think it is, don't hes=
itate to tell me
> > > >> >>>>>>>>>> in a public reply, it's in everyone's interest to set t=
he public record
> > > >> >>>>>>>>>> straight.
> > > >> >>>>>>>>>>
> > > >> >>>>>>>>>> On 14.03.22 14:00, Satadru Pramanik wrote:
> > > >> >>>>>>>>>>> This still appears to be an issue in 5.17-rc8.
> > > >> >>>>>>>>>>>
> > > >> >>>>>>>>>>> I would also not this issue appears when the samba ser=
ver reboots. The
> > > >> >>>>>>>>>>> client has an unresponsive cifs mount instead of attem=
pting to retry
> > > >> >>>>>>>>>>> the connection.
> > > >> >>>>>>>>>>>
> > > >> >>>>>>>>>>> dmesg after resume from suspend on 5.17-rc8:
> > > >> >>>>>>>>>>>
> > > >> >>>>>>>>>>> [ 4072.503603] PM: suspend exit
> > > >> >>>>>>>>>>> [ 4076.381594] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: =
link becomes ready
> > > >> >>>>>>>>>>> [ 4090.501947] CIFS: fs/cifs/inode.c: VFS: in
> > > >> >>>>>>>>>>> cifs_revalidate_dentry_attr as Xid: 633 with uid: 0
> > > >> >>>>>>>>>>> [ 4090.501966] CIFS: fs/cifs/inode.c: Update attribute=
s: \bin inode
> > > >> >>>>>>>>>>> 0x00000000b30e5246 count 1 dentry: 0x0000000080235318 =
d_time
> > > >> >>>>>>>>>>> 4295826505 jiffies 4295914933
> > > >> >>>>>>>>>>> [ 4090.502012] CIFS: fs/cifs/transport.c: wait_for_fre=
e_credits:
> > > >> >>>>>>>>>>> remove 3 credits total=3D3005
> > > >> >>>>>>>>>>> [ 4090.502053] CIFS: fs/cifs/smb2ops.c: Encrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4090.502081] CIFS: fs/cifs/transport.c: Sending smb:=
 smb_len=3D400
> > > >> >>>>>>>>>>> [ 4096.800754] CIFS: fs/cifs/cifsfs.c: VFS: in cifs_st=
atfs as Xid: 634
> > > >> >>>>>>>>>>> with uid: 1000
> > > >> >>>>>>>>>>> [ 4096.800783] CIFS: fs/cifs/transport.c: wait_for_fre=
e_credits:
> > > >> >>>>>>>>>>> remove 3 credits total=3D3002
> > > >> >>>>>>>>>>> [ 4096.800822] CIFS: fs/cifs/smb2ops.c: Encrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4096.800845] CIFS: fs/cifs/transport.c: Sending smb:=
 smb_len=3D400
> > > >> >>>>>>>>>>> [ 4099.320129] CIFS: fs/cifs/dir.c: VFS: in cifs_looku=
p as Xid: 635
> > > >> >>>>>>>>>>> with uid: 1000
> > > >> >>>>>>>>>>> [ 4099.320137] CIFS: fs/cifs/dir.c: parent inode =3D 0=
x00000000cc8fcd81
> > > >> >>>>>>>>>>> name is: bashprompt.sh and dentry =3D 0x000000007afa43=
36
> > > >> >>>>>>>>>>> [ 4099.320143] CIFS: fs/cifs/dir.c: NULL inode in look=
up
> > > >> >>>>>>>>>>> [ 4099.320145] CIFS: fs/cifs/dir.c: Full path: \bashpr=
ompt.sh inode =3D
> > > >> >>>>>>>>>>> 0x0000000000000000
> > > >> >>>>>>>>>>> [ 4099.320164] CIFS: fs/cifs/transport.c: wait_for_fre=
e_credits:
> > > >> >>>>>>>>>>> remove 3 credits total=3D2999
> > > >> >>>>>>>>>>> [ 4099.320185] CIFS: fs/cifs/smb2ops.c: Encrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4099.320193] CIFS: fs/cifs/transport.c: Sending smb:=
 smb_len=3D424
> > > >> >>>>>>>>>>> [ 4105.135867] CIFS: fs/cifs/smb2pdu.c: In echo reques=
t for conn_id 4
> > > >> >>>>>>>>>>> [ 4105.135891] CIFS: fs/cifs/transport.c: wait_for_fre=
e_credits:
> > > >> >>>>>>>>>>> remove 1 credits total=3D0
> > > >> >>>>>>>>>>> [ 4105.135921] CIFS: fs/cifs/transport.c: Sending smb:=
 smb_len=3D72
> > > >> >>>>>>>>>>> [ 4166.576112] CIFS: fs/cifs/smb2pdu.c: In echo reques=
t for conn_id 4
> > > >> >>>>>>>>>>> [ 4166.576131] CIFS: fs/cifs/smb2pdu.c: Echo request f=
ailed: -11
> > > >> >>>>>>>>>>> [ 4166.576138] CIFS: fs/cifs/connect.c: Unable to send=
 echo request to
> > > >> >>>>>>>>>>> server: cheekon
> > > >> >>>>>>>>>>> [ 4204.895155] CIFS: fs/cifs/inode.c: VFS: in
> > > >> >>>>>>>>>>> cifs_revalidate_dentry_attr as Xid: 636 with uid: 1000
> > > >> >>>>>>>>>>> [ 4204.895165] CIFS: fs/cifs/inode.c: Update attribute=
s:  inode
> > > >> >>>>>>>>>>> 0x00000000cc8fcd81 count 2 dentry: 0x000000002b8e3e8b =
d_time 0 jiffies
> > > >> >>>>>>>>>>> 4295943531
> > > >> >>>>>>>>>>> [ 4204.895186] CIFS: fs/cifs/transport.c: wait_for_fre=
e_credits:
> > > >> >>>>>>>>>>> remove 3 credits total=3D2996
> > > >> >>>>>>>>>>> [ 4204.895210] CIFS: fs/cifs/smb2ops.c: Encrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4204.895221] CIFS: fs/cifs/transport.c: Sending smb:=
 smb_len=3D400
> > > >> >>>>>>>>>>> [ 4205.757794] CIFS: fs/cifs/transport.c: \\cheekon Ca=
ncelling wait
> > > >> >>>>>>>>>>> for mid 321 cmd: 5
> > > >> >>>>>>>>>>> [ 4205.757811] CIFS: fs/cifs/transport.c: \\cheekon Ca=
ncelling wait
> > > >> >>>>>>>>>>> for mid 322 cmd: 16
> > > >> >>>>>>>>>>> [ 4205.757816] CIFS: fs/cifs/transport.c: \\cheekon Ca=
ncelling wait
> > > >> >>>>>>>>>>> for mid 323 cmd: 6
> > > >> >>>>>>>>>>> [ 4205.757832] CIFS: fs/cifs/inode.c: cifs_get_inode_i=
nfo: unhandled err rc -512
> > > >> >>>>>>>>>>> [ 4205.757840] CIFS: fs/cifs/inode.c: VFS: leaving
> > > >> >>>>>>>>>>> cifs_revalidate_dentry_attr (xid =3D 636) rc =3D -512
> > > >> >>>>>>>>>>>
> > > >> >>>>>>>>>>>
> > > >> >>>>>>>>>>> Also including a manual unmount and remount:
> > > >> >>>>>>>>>>>
> > > >> >>>>>>>>>>> [ 4205.757840] CIFS: fs/cifs/inode.c: VFS: leaving
> > > >> >>>>>>>>>>> cifs_revalidate_dentry_attr (xid =3D 636) rc =3D -512
> > > >> >>>>>>>>>>> [ 4220.854276] CIFS: VFS: \\cheekon has not responded =
in 180 seconds.
> > > >> >>>>>>>>>>> Reconnecting...
> > > >> >>>>>>>>>>> [ 4220.854284] CIFS: fs/cifs/connect.c: Mark tcp sessi=
on as need reconnect
> > > >> >>>>>>>>>>> [ 4220.854287] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> cifs_mark_tcp_ses_conns_for_reconnect: marking necessa=
ry sessions and
> > > >> >>>>>>>>>>> tcons for reconnect
> > > >> >>>>>>>>>>> [ 4220.854289] CIFS: fs/cifs/sess.c: Set reconnect bit=
mask for chan 0; now 0x1
> > > >> >>>>>>>>>>> [ 4220.854292] CIFS: fs/cifs/connect.c: cifs_abort_con=
nection: tearing
> > > >> >>>>>>>>>>> down socket
> > > >> >>>>>>>>>>> [ 4220.854293] CIFS: fs/cifs/connect.c: State: 0x3 Fla=
gs: 0x0
> > > >> >>>>>>>>>>> [ 4220.854371] CIFS: fs/cifs/connect.c: Post shutdown =
state: 0x3 Flags: 0x0
> > > >> >>>>>>>>>>> [ 4220.854378] CIFS: fs/cifs/connect.c: cifs_abort_con=
nection: moving
> > > >> >>>>>>>>>>> mids to private list
> > > >> >>>>>>>>>>> [ 4220.854380] CIFS: fs/cifs/connect.c: cifs_abort_con=
nection: issuing
> > > >> >>>>>>>>>>> mid callbacks
> > > >> >>>>>>>>>>> [ 4220.854383] cifs_small_buf_release: 1 callbacks sup=
pressed
> > > >> >>>>>>>>>>> [ 4220.854384] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4220.854387] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4220.854388] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4220.854397] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4220.854412] CIFS: fs/cifs/dns_resolve.c:
> > > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is=
 whole unc:
> > > >> >>>>>>>>>>> \\cheekon
> > > >> >>>>>>>>>>> [ 4220.854425] CIFS: fs/cifs/transport.c: cifs_sync_mi=
d_result: cmd=3D5
> > > >> >>>>>>>>>>> mid=3D317 state=3D8
> > > >> >>>>>>>>>>> [ 4220.854431] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4220.854431] CIFS: fs/cifs/transport.c: cifs_sync_mi=
d_result: cmd=3D5
> > > >> >>>>>>>>>>> mid=3D314 state=3D8
> > > >> >>>>>>>>>>> [ 4220.854433] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4220.854437] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4220.854439] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4220.854442] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4220.854444] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4220.854451] CIFS: fs/cifs/inode.c: cifs_get_inode_i=
nfo: unhandled err rc -11
> > > >> >>>>>>>>>>> [ 4220.854450] CIFS: fs/cifs/cifsfs.c: VFS: leaving ci=
fs_statfs (xid =3D
> > > >> >>>>>>>>>>> 634) rc =3D -11
> > > >> >>>>>>>>>>> [ 4220.854451] CIFS: fs/cifs/inode.c: cifs_get_inode_i=
nfo: unhandled err rc -11
> > > >> >>>>>>>>>>> [ 4220.854463] CIFS: fs/cifs/smb2pdu.c: smb2_reconnect=
: aborting
> > > >> >>>>>>>>>>> reconnect due to a received signal by the process
> > > >> >>>>>>>>>>> [ 4220.854463] CIFS: fs/cifs/inode.c: cifs_get_inode_i=
nfo: unhandled err rc -512
> > > >> >>>>>>>>>>> [ 4220.854466] CIFS: fs/cifs/inode.c: cifs_get_inode_i=
nfo: unhandled err rc -512
> > > >> >>>>>>>>>>> [ 4220.854467] CIFS: fs/cifs/inode.c: VFS: leaving
> > > >> >>>>>>>>>>> cifs_revalidate_dentry_attr (xid =3D 633) rc =3D -512
> > > >> >>>>>>>>>>> [ 4220.854468] CIFS: fs/cifs/dir.c: Unexpected lookup =
error -512
> > > >> >>>>>>>>>>> [ 4220.854470] CIFS: fs/cifs/dir.c: cifs_revalidate_de=
ntry failed with rc=3D-512
> > > >> >>>>>>>>>>> [ 4220.854470] CIFS: fs/cifs/dir.c: VFS: leaving cifs_=
lookup (xid =3D
> > > >> >>>>>>>>>>> 635) rc =3D -512
> > > >> >>>>>>>>>>> [ 4220.854490] CIFS: fs/cifs/dir.c: VFS: in cifs_looku=
p as Xid: 637
> > > >> >>>>>>>>>>> with uid: 1000
> > > >> >>>>>>>>>>> [ 4220.854493] CIFS: fs/cifs/dir.c: parent inode =3D 0=
x00000000cc8fcd81
> > > >> >>>>>>>>>>> name is: bashprompt.sh and dentry =3D 0x00000000afae7b=
a3
> > > >> >>>>>>>>>>> [ 4220.854498] CIFS: fs/cifs/dir.c: NULL inode in look=
up
> > > >> >>>>>>>>>>> [ 4220.854499] CIFS: fs/cifs/dir.c: Full path: \bashpr=
ompt.sh inode =3D
> > > >> >>>>>>>>>>> 0x0000000000000000
> > > >> >>>>>>>>>>> [ 4220.854508] CIFS: fs/cifs/smb2pdu.c: smb2_reconnect=
: aborting
> > > >> >>>>>>>>>>> reconnect due to a received signal by the process
> > > >> >>>>>>>>>>> [ 4220.854511] CIFS: fs/cifs/inode.c: cifs_get_inode_i=
nfo: unhandled err rc -512
> > > >> >>>>>>>>>>> [ 4220.854513] CIFS: fs/cifs/dir.c: Unexpected lookup =
error -512
> > > >> >>>>>>>>>>> [ 4220.854514] CIFS: fs/cifs/dir.c: VFS: leaving cifs_=
lookup (xid =3D
> > > >> >>>>>>>>>>> 637) rc =3D -512
> > > >> >>>>>>>>>>> [ 4220.854523] CIFS: fs/cifs/dir.c: VFS: in cifs_looku=
p as Xid: 638
> > > >> >>>>>>>>>>> with uid: 1000
> > > >> >>>>>>>>>>> [ 4220.854529] CIFS: fs/cifs/dir.c: parent inode =3D 0=
x00000000cc8fcd81
> > > >> >>>>>>>>>>> name is: bashprompt.sh and dentry =3D 0x00000000fe6929=
02
> > > >> >>>>>>>>>>> [ 4220.854535] CIFS: fs/cifs/dir.c: NULL inode in look=
up
> > > >> >>>>>>>>>>> [ 4220.854536] CIFS: fs/cifs/dir.c: Full path: \bashpr=
ompt.sh inode =3D
> > > >> >>>>>>>>>>> 0x0000000000000000
> > > >> >>>>>>>>>>> [ 4220.854546] CIFS: fs/cifs/smb2pdu.c: smb2_reconnect=
: aborting
> > > >> >>>>>>>>>>> reconnect due to a received signal by the process
> > > >> >>>>>>>>>>> [ 4220.854549] CIFS: fs/cifs/inode.c: cifs_get_inode_i=
nfo: unhandled err rc -512
> > > >> >>>>>>>>>>> [ 4220.854552] CIFS: fs/cifs/dir.c: Unexpected lookup =
error -512
> > > >> >>>>>>>>>>> [ 4220.854554] CIFS: fs/cifs/dir.c: VFS: leaving cifs_=
lookup (xid =3D
> > > >> >>>>>>>>>>> 638) rc =3D -512
> > > >> >>>>>>>>>>> [ 4220.855211] CIFS: fs/cifs/inode.c: VFS: in
> > > >> >>>>>>>>>>> cifs_revalidate_dentry_attr as Xid: 639 with uid: 0
> > > >> >>>>>>>>>>> [ 4220.855218] CIFS: fs/cifs/inode.c: Update attribute=
s: \bin inode
> > > >> >>>>>>>>>>> 0x00000000b30e5246 count 1 dentry: 0x0000000080235318 =
d_time
> > > >> >>>>>>>>>>> 4295826505 jiffies 4295947521
> > > >> >>>>>>>>>>> [ 4220.856348] CIFS: fs/cifs/cifsfs.c: VFS: in cifs_st=
atfs as Xid: 640
> > > >> >>>>>>>>>>> with uid: 1000
> > > >> >>>>>>>>>>> [ 4225.844263] CIFS: fs/cifs/dns_resolve.c:
> > > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: chee=
kon
> > > >> >>>>>>>>>>> [ 4225.844273] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve ser=
ver part of
> > > >> >>>>>>>>>>> cheekon to IP: -4
> > > >> >>>>>>>>>>> [ 4225.844276] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution s=
cheduled for 600
> > > >> >>>>>>>>>>> seconds in the future
> > > >> >>>>>>>>>>> [ 4225.844281] CIFS: fs/cifs/connect.c: __cifs_reconne=
ct:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> > > >> >>>>>>>>>>> [ 4225.844283] CIFS: fs/cifs/connect.c: generic_ip_con=
nect: connecting
> > > >> >>>>>>>>>>> to 192.168.0.20:445
> > > >> >>>>>>>>>>> [ 4225.844293] CIFS: fs/cifs/connect.c: Socket created
> > > >> >>>>>>>>>>> [ 4225.844295] CIFS: fs/cifs/connect.c: sndbuf 16384 r=
cvbuf 131072
> > > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > > >> >>>>>>>>>>> [ 4228.912632] CIFS: fs/cifs/connect.c: Error -113 con=
necting to server
> > > >> >>>>>>>>>>> [ 4228.912670] CIFS: fs/cifs/connect.c: __cifs_reconne=
ct: reconnect error -113
> > > >> >>>>>>>>>>> [ 4231.088378] CIFS: fs/cifs/smb2pdu.c: gave up waitin=
g on reconnect in smb_init
> > > >> >>>>>>>>>>> [ 4231.088383] CIFS: fs/cifs/smb2pdu.c: gave up waitin=
g on reconnect in smb_init
> > > >> >>>>>>>>>>> [ 4231.088385] cifs_small_buf_release: 7 callbacks sup=
pressed
> > > >> >>>>>>>>>>> [ 4231.088387] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4231.088388] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4231.088390] CIFS: fs/cifs/cifsfs.c: VFS: leaving ci=
fs_statfs (xid =3D
> > > >> >>>>>>>>>>> 640) rc =3D -112
> > > >> >>>>>>>>>>> [ 4231.088393] CIFS: fs/cifs/inode.c: cifs_get_inode_i=
nfo: unhandled err rc -112
> > > >> >>>>>>>>>>> [ 4231.088398] CIFS: fs/cifs/inode.c: VFS: leaving
> > > >> >>>>>>>>>>> cifs_revalidate_dentry_attr (xid =3D 639) rc =3D -112
> > > >> >>>>>>>>>>> [ 4231.088401] CIFS: fs/cifs/dir.c: cifs_revalidate_de=
ntry failed with rc=3D-112
> > > >> >>>>>>>>>>> [ 4231.088421] CIFS: fs/cifs/inode.c: VFS: in
> > > >> >>>>>>>>>>> cifs_revalidate_dentry_attr as Xid: 641 with uid: 0
> > > >> >>>>>>>>>>> [ 4231.088425] CIFS: fs/cifs/inode.c: Update attribute=
s: \x86_64 inode
> > > >> >>>>>>>>>>> 0x000000004022c915 count 1 dentry: 0x00000000669397cc =
d_time
> > > >> >>>>>>>>>>> 4295826508 jiffies 4295950080
> > > >> >>>>>>>>>>> [ 4232.112342] CIFS: fs/cifs/dns_resolve.c:
> > > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is=
 whole unc:
> > > >> >>>>>>>>>>> \\cheekon
> > > >> >>>>>>>>>>> [ 4238.141384] CIFS: fs/cifs/dns_resolve.c:
> > > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: chee=
kon
> > > >> >>>>>>>>>>> [ 4238.141400] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve ser=
ver part of
> > > >> >>>>>>>>>>> cheekon to IP: -4
> > > >> >>>>>>>>>>> [ 4238.141408] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution s=
cheduled for 600
> > > >> >>>>>>>>>>> seconds in the future
> > > >> >>>>>>>>>>> [ 4238.141417] CIFS: fs/cifs/connect.c: __cifs_reconne=
ct:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> > > >> >>>>>>>>>>> [ 4238.141422] CIFS: fs/cifs/connect.c: generic_ip_con=
nect: connecting
> > > >> >>>>>>>>>>> to 192.168.0.20:445
> > > >> >>>>>>>>>>> [ 4238.141441] CIFS: fs/cifs/connect.c: Socket created
> > > >> >>>>>>>>>>> [ 4238.141445] CIFS: fs/cifs/connect.c: sndbuf 16384 r=
cvbuf 131072
> > > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > > >> >>>>>>>>>>> [ 4241.200798] CIFS: fs/cifs/connect.c: Error -113 con=
necting to server
> > > >> >>>>>>>>>>> [ 4241.200826] CIFS: fs/cifs/connect.c: __cifs_reconne=
ct: reconnect error -113
> > > >> >>>>>>>>>>> [ 4241.328397] CIFS: fs/cifs/smb2pdu.c: gave up waitin=
g on reconnect in smb_init
> > > >> >>>>>>>>>>> [ 4241.328409] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4241.328417] CIFS: fs/cifs/inode.c: cifs_get_inode_i=
nfo: unhandled err rc -112
> > > >> >>>>>>>>>>> [ 4241.328423] CIFS: fs/cifs/inode.c: VFS: leaving
> > > >> >>>>>>>>>>> cifs_revalidate_dentry_attr (xid =3D 641) rc =3D -112
> > > >> >>>>>>>>>>> [ 4241.328426] CIFS: fs/cifs/dir.c: cifs_revalidate_de=
ntry failed with rc=3D-112
> > > >> >>>>>>>>>>> [ 4244.400422] CIFS: fs/cifs/dns_resolve.c:
> > > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is=
 whole unc:
> > > >> >>>>>>>>>>> \\cheekon
> > > >> >>>>>>>>>>> [ 4250.434011] CIFS: fs/cifs/dns_resolve.c:
> > > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: chee=
kon
> > > >> >>>>>>>>>>> [ 4250.434033] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve ser=
ver part of
> > > >> >>>>>>>>>>> cheekon to IP: -4
> > > >> >>>>>>>>>>> [ 4250.434043] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution s=
cheduled for 600
> > > >> >>>>>>>>>>> seconds in the future
> > > >> >>>>>>>>>>> [ 4250.434056] CIFS: fs/cifs/connect.c: __cifs_reconne=
ct:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> > > >> >>>>>>>>>>> [ 4250.434063] CIFS: fs/cifs/connect.c: generic_ip_con=
nect: connecting
> > > >> >>>>>>>>>>> to 192.168.0.20:445
> > > >> >>>>>>>>>>> [ 4250.434086] CIFS: fs/cifs/connect.c: Socket created
> > > >> >>>>>>>>>>> [ 4250.434091] CIFS: fs/cifs/connect.c: sndbuf 16384 r=
cvbuf 131072
> > > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > > >> >>>>>>>>>>> [ 4253.488848] CIFS: fs/cifs/connect.c: Error -113 con=
necting to server
> > > >> >>>>>>>>>>> [ 4253.488875] CIFS: fs/cifs/connect.c: __cifs_reconne=
ct: reconnect error -113
> > > >> >>>>>>>>>>> [ 4256.688419] CIFS: fs/cifs/dns_resolve.c:
> > > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is=
 whole unc:
> > > >> >>>>>>>>>>> \\cheekon
> > > >> >>>>>>>>>>> [ 4265.790981] CIFS: fs/cifs/dns_resolve.c:
> > > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: chee=
kon
> > > >> >>>>>>>>>>> [ 4265.790995] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve ser=
ver part of
> > > >> >>>>>>>>>>> cheekon to IP: -4
> > > >> >>>>>>>>>>> [ 4265.791000] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution s=
cheduled for 600
> > > >> >>>>>>>>>>> seconds in the future
> > > >> >>>>>>>>>>> [ 4265.791005] CIFS: fs/cifs/connect.c: __cifs_reconne=
ct:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> > > >> >>>>>>>>>>> [ 4265.791008] CIFS: fs/cifs/connect.c: generic_ip_con=
nect: connecting
> > > >> >>>>>>>>>>> to 192.168.0.20:445
> > > >> >>>>>>>>>>> [ 4265.791022] CIFS: fs/cifs/connect.c: Socket created
> > > >> >>>>>>>>>>> [ 4265.791025] CIFS: fs/cifs/connect.c: sndbuf 16384 r=
cvbuf 131072
> > > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > > >> >>>>>>>>>>> [ 4268.848709] CIFS: fs/cifs/connect.c: Error -113 con=
necting to server
> > > >> >>>>>>>>>>> [ 4268.848752] CIFS: fs/cifs/connect.c: __cifs_reconne=
ct: reconnect error -113
> > > >> >>>>>>>>>>> [ 4272.052440] CIFS: fs/cifs/dns_resolve.c:
> > > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is=
 whole unc:
> > > >> >>>>>>>>>>> \\cheekon
> > > >> >>>>>>>>>>> [ 4278.078864] CIFS: fs/cifs/dns_resolve.c:
> > > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: chee=
kon
> > > >> >>>>>>>>>>> [ 4278.078889] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve ser=
ver part of
> > > >> >>>>>>>>>>> cheekon to IP: -4
> > > >> >>>>>>>>>>> [ 4278.078898] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution s=
cheduled for 600
> > > >> >>>>>>>>>>> seconds in the future
> > > >> >>>>>>>>>>> [ 4278.078904] CIFS: fs/cifs/connect.c: __cifs_reconne=
ct:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> > > >> >>>>>>>>>>> [ 4278.078911] CIFS: fs/cifs/connect.c: generic_ip_con=
nect: connecting
> > > >> >>>>>>>>>>> to 192.168.0.20:445
> > > >> >>>>>>>>>>> [ 4278.078937] CIFS: fs/cifs/connect.c: Socket created
> > > >> >>>>>>>>>>> [ 4278.078942] CIFS: fs/cifs/connect.c: sndbuf 16384 r=
cvbuf 131072
> > > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > > >> >>>>>>>>>>> [ 4280.826140] CIFS: fs/cifs/cifsfs.c: VFS: in cifs_st=
atfs as Xid: 642
> > > >> >>>>>>>>>>> with uid: 1000
> > > >> >>>>>>>>>>> [ 4281.136704] CIFS: fs/cifs/connect.c: Error -113 con=
necting to server
> > > >> >>>>>>>>>>> [ 4281.136737] CIFS: fs/cifs/connect.c: __cifs_reconne=
ct: reconnect error -113
> > > >> >>>>>>>>>>> [ 4284.336534] CIFS: fs/cifs/dns_resolve.c:
> > > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is=
 whole unc:
> > > >> >>>>>>>>>>> \\cheekon
> > > >> >>>>>>>>>>> [ 4290.992510] CIFS: fs/cifs/smb2pdu.c: gave up waitin=
g on reconnect in smb_init
> > > >> >>>>>>>>>>> [ 4290.992532] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4290.992543] CIFS: fs/cifs/cifsfs.c: VFS: leaving ci=
fs_statfs (xid =3D
> > > >> >>>>>>>>>>> 642) rc =3D -112
> > > >> >>>>>>>>>>> [ 4292.289757] CIFS: fs/cifs/dns_resolve.c:
> > > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: chee=
kon
> > > >> >>>>>>>>>>> [ 4292.289765] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve ser=
ver part of
> > > >> >>>>>>>>>>> cheekon to IP: -4
> > > >> >>>>>>>>>>> [ 4292.289769] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution s=
cheduled for 600
> > > >> >>>>>>>>>>> seconds in the future
> > > >> >>>>>>>>>>> [ 4292.289773] CIFS: fs/cifs/connect.c: __cifs_reconne=
ct:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> > > >> >>>>>>>>>>> [ 4292.289776] CIFS: fs/cifs/connect.c: generic_ip_con=
nect: connecting
> > > >> >>>>>>>>>>> to 192.168.0.20:445
> > > >> >>>>>>>>>>> [ 4292.289793] CIFS: fs/cifs/connect.c: Socket created
> > > >> >>>>>>>>>>> [ 4292.289794] CIFS: fs/cifs/connect.c: sndbuf 16384 r=
cvbuf 131072
> > > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > > >> >>>>>>>>>>> [ 4295.348741] CIFS: fs/cifs/connect.c: Error -113 con=
necting to server
> > > >> >>>>>>>>>>> [ 4295.348773] CIFS: fs/cifs/connect.c: __cifs_reconne=
ct: reconnect error -113
> > > >> >>>>>>>>>>> [ 4298.416556] CIFS: fs/cifs/dns_resolve.c:
> > > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is=
 whole unc:
> > > >> >>>>>>>>>>> \\cheekon
> > > >> >>>>>>>>>>> [ 4308.425564] CIFS: fs/cifs/dns_resolve.c:
> > > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: chee=
kon
> > > >> >>>>>>>>>>> [ 4308.425582] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve ser=
ver part of
> > > >> >>>>>>>>>>> cheekon to IP: -4
> > > >> >>>>>>>>>>> [ 4308.425589] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution s=
cheduled for 600
> > > >> >>>>>>>>>>> seconds in the future
> > > >> >>>>>>>>>>> [ 4308.425595] CIFS: fs/cifs/connect.c: __cifs_reconne=
ct:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> > > >> >>>>>>>>>>> [ 4308.425599] CIFS: fs/cifs/connect.c: generic_ip_con=
nect: connecting
> > > >> >>>>>>>>>>> to 192.168.0.20:445
> > > >> >>>>>>>>>>> [ 4308.425621] CIFS: fs/cifs/connect.c: Socket created
> > > >> >>>>>>>>>>> [ 4308.425625] CIFS: fs/cifs/connect.c: sndbuf 16384 r=
cvbuf 131072
> > > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > > >> >>>>>>>>>>> [ 4311.505060] CIFS: fs/cifs/connect.c: Error -113 con=
necting to server
> > > >> >>>>>>>>>>> [ 4311.505094] CIFS: fs/cifs/connect.c: __cifs_reconne=
ct: reconnect error -113
> > > >> >>>>>>>>>>> [ 4314.544551] CIFS: fs/cifs/dns_resolve.c:
> > > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is=
 whole unc:
> > > >> >>>>>>>>>>> \\cheekon
> > > >> >>>>>>>>>>> [ 4323.328365] CIFS: fs/cifs/dns_resolve.c:
> > > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: chee=
kon
> > > >> >>>>>>>>>>> [ 4323.328387] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve ser=
ver part of
> > > >> >>>>>>>>>>> cheekon to IP: -4
> > > >> >>>>>>>>>>> [ 4323.328397] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution s=
cheduled for 600
> > > >> >>>>>>>>>>> seconds in the future
> > > >> >>>>>>>>>>> [ 4323.328406] CIFS: fs/cifs/connect.c: __cifs_reconne=
ct:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> > > >> >>>>>>>>>>> [ 4323.328413] CIFS: fs/cifs/connect.c: generic_ip_con=
nect: connecting
> > > >> >>>>>>>>>>> to 192.168.0.20:445
> > > >> >>>>>>>>>>> [ 4323.328437] CIFS: fs/cifs/connect.c: Socket created
> > > >> >>>>>>>>>>> [ 4323.328441] CIFS: fs/cifs/connect.c: sndbuf 16384 r=
cvbuf 131072
> > > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > > >> >>>>>>>>>>> [ 4326.384727] CIFS: fs/cifs/connect.c: Error -113 con=
necting to server
> > > >> >>>>>>>>>>> [ 4326.384755] CIFS: fs/cifs/connect.c: __cifs_reconne=
ct: reconnect error -113
> > > >> >>>>>>>>>>> [ 4329.392599] CIFS: fs/cifs/dns_resolve.c:
> > > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is=
 whole unc:
> > > >> >>>>>>>>>>> \\cheekon
> > > >> >>>>>>>>>>> [ 4339.406543] CIFS: fs/cifs/dns_resolve.c:
> > > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: chee=
kon
> > > >> >>>>>>>>>>> [ 4339.406550] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve ser=
ver part of
> > > >> >>>>>>>>>>> cheekon to IP: -4
> > > >> >>>>>>>>>>> [ 4339.406553] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution s=
cheduled for 600
> > > >> >>>>>>>>>>> seconds in the future
> > > >> >>>>>>>>>>> [ 4339.406556] CIFS: fs/cifs/connect.c: __cifs_reconne=
ct:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> > > >> >>>>>>>>>>> [ 4339.406559] CIFS: fs/cifs/connect.c: generic_ip_con=
nect: connecting
> > > >> >>>>>>>>>>> to 192.168.0.20:445
> > > >> >>>>>>>>>>> [ 4339.406567] CIFS: fs/cifs/connect.c: Socket created
> > > >> >>>>>>>>>>> [ 4339.406568] CIFS: fs/cifs/connect.c: sndbuf 16384 r=
cvbuf 131072
> > > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > > >> >>>>>>>>>>> [ 4340.826465] CIFS: fs/cifs/cifsfs.c: VFS: in cifs_st=
atfs as Xid: 643
> > > >> >>>>>>>>>>> with uid: 1000
> > > >> >>>>>>>>>>> [ 4342.481043] CIFS: fs/cifs/connect.c: Error -113 con=
necting to server
> > > >> >>>>>>>>>>> [ 4342.481071] CIFS: fs/cifs/connect.c: __cifs_reconne=
ct: reconnect error -113
> > > >> >>>>>>>>>>> [ 4343.513393] CIFS: fs/cifs/inode.c: VFS: in
> > > >> >>>>>>>>>>> cifs_revalidate_dentry_attr as Xid: 644 with uid: 0
> > > >> >>>>>>>>>>> [ 4343.513400] CIFS: fs/cifs/inode.c: Update attribute=
s:  inode
> > > >> >>>>>>>>>>> 0x00000000cc8fcd81 count 2 dentry: 0x000000002b8e3e8b =
d_time 0 jiffies
> > > >> >>>>>>>>>>> 4295978186
> > > >> >>>>>>>>>>> [ 4345.520578] CIFS: fs/cifs/dns_resolve.c:
> > > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is=
 whole unc:
> > > >> >>>>>>>>>>> \\cheekon
> > > >> >>>>>>>>>>> [ 4350.900608] CIFS: fs/cifs/smb2pdu.c: gave up waitin=
g on reconnect in smb_init
> > > >> >>>>>>>>>>> [ 4350.900628] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4350.900632] CIFS: fs/cifs/cifsfs.c: VFS: leaving ci=
fs_statfs (xid =3D
> > > >> >>>>>>>>>>> 643) rc =3D -112
> > > >> >>>>>>>>>>> [ 4353.712700] CIFS: fs/cifs/smb2pdu.c: gave up waitin=
g on reconnect in smb_init
> > > >> >>>>>>>>>>> [ 4353.712720] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4353.712728] CIFS: fs/cifs/inode.c: cifs_get_inode_i=
nfo: unhandled err rc -112
> > > >> >>>>>>>>>>> [ 4353.712734] CIFS: fs/cifs/inode.c: VFS: leaving
> > > >> >>>>>>>>>>> cifs_revalidate_dentry_attr (xid =3D 644) rc =3D -112
> > > >> >>>>>>>>>>> [ 4353.714004] CIFS: fs/cifs/connect.c: cifs_put_tcon:=
 tc_count=3D1
> > > >> >>>>>>>>>>> [ 4353.714015] CIFS: fs/cifs/connect.c: VFS: in cifs_p=
ut_tcon as Xid:
> > > >> >>>>>>>>>>> 645 with uid: 0
> > > >> >>>>>>>>>>> [ 4353.714020] CIFS: fs/cifs/smb2pdu.c: Tree Disconnec=
t
> > > >> >>>>>>>>>>> [ 4353.714024] CIFS: fs/cifs/fscache.c:
> > > >> >>>>>>>>>>> cifs_fscache_release_super_cookie: (0x0000000000000000=
)
> > > >> >>>>>>>>>>> [ 4353.714032] CIFS: fs/cifs/connect.c: cifs_put_smb_s=
es: ses_count=3D1
> > > >> >>>>>>>>>>> [ 4353.714037] CIFS: fs/cifs/connect.c: cifs_put_smb_s=
es: ses_count=3D1
> > > >> >>>>>>>>>>> [ 4353.714039] CIFS: fs/cifs/connect.c: cifs_put_smb_s=
es: ses ipc:
> > > >> >>>>>>>>>>> \\cheekon\IPC$
> > > >> >>>>>>>>>>> [ 4355.529971] CIFS: fs/cifs/dns_resolve.c:
> > > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: chee=
kon
> > > >> >>>>>>>>>>> [ 4355.529988] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve ser=
ver part of
> > > >> >>>>>>>>>>> \x1b\x86\xb9\xeaj1\x15\xb2;\x87\xb9\xeaj1\x15\x8a@\x04=
 to IP: -4
> > > >> >>>>>>>>>>> [ 4355.529996] CIFS: fs/cifs/connect.c:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution s=
cheduled for 600
> > > >> >>>>>>>>>>> seconds in the future
> > > >> >>>>>>>>>>> [ 4355.530002] CIFS: fs/cifs/connect.c: __cifs_reconne=
ct:
> > > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> > > >> >>>>>>>>>>> [ 4355.530006] CIFS: fs/cifs/connect.c: generic_ip_con=
nect: connecting
> > > >> >>>>>>>>>>> to 192.168.0.20:445
> > > >> >>>>>>>>>>> [ 4355.530025] CIFS: fs/cifs/connect.c: Socket created
> > > >> >>>>>>>>>>> [ 4355.530027] CIFS: fs/cifs/connect.c: sndbuf 16384 r=
cvbuf 131072
> > > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > > >> >>>>>>>>>>> [ 4355.530185] CIFS: fs/cifs/connect.c: Error -4 conne=
cting to server
> > > >> >>>>>>>>>>> [ 4355.530201] CIFS: fs/cifs/connect.c: __cifs_reconne=
ct: reconnect error -4
> > > >> >>>>>>>>>>> [ 4372.001470] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: =
link becomes ready
> > > >> >>>>>>>>>>> [ 4377.427015] smb3_fs_context_parse_param: 1 callback=
s suppressed
> > > >> >>>>>>>>>>> [ 4377.427018] CIFS: fs/cifs/fs_context.c: CIFS: parsi=
ng cifs mount
> > > >> >>>>>>>>>>> option 'source'
> > > >> >>>>>>>>>>> [ 4377.427025] CIFS: fs/cifs/fs_context.c: CIFS: parsi=
ng cifs mount option 'ip'
> > > >> >>>>>>>>>>> [ 4377.427028] CIFS: fs/cifs/fs_context.c: CIFS: parsi=
ng cifs mount option 'unc'
> > > >> >>>>>>>>>>> [ 4377.427030] CIFS: fs/cifs/fs_context.c: CIFS: parsi=
ng cifs mount
> > > >> >>>>>>>>>>> option 'forceuid'
> > > >> >>>>>>>>>>> [ 4377.427032] CIFS: fs/cifs/fs_context.c: CIFS: parsi=
ng cifs mount
> > > >> >>>>>>>>>>> option 'resilienthandles'
> > > >> >>>>>>>>>>> [ 4377.427033] CIFS: fs/cifs/fs_context.c: CIFS: parsi=
ng cifs mount
> > > >> >>>>>>>>>>> option 'vers'
> > > >> >>>>>>>>>>> [ 4377.427036] CIFS: fs/cifs/fs_context.c: CIFS: parsi=
ng cifs mount
> > > >> >>>>>>>>>>> option 'iocharset'
> > > >> >>>>>>>>>>> [ 4377.427038] CIFS: fs/cifs/fs_context.c: iocharset s=
et to utf8
> > > >> >>>>>>>>>>> [ 4377.427039] CIFS: fs/cifs/fs_context.c: CIFS: parsi=
ng cifs mount
> > > >> >>>>>>>>>>> option 'cifsacl'
> > > >> >>>>>>>>>>> [ 4377.427040] CIFS: fs/cifs/fs_context.c: CIFS: parsi=
ng cifs mount option 'uid'
> > > >> >>>>>>>>>>> [ 4377.427043] CIFS: fs/cifs/fs_context.c: CIFS: parsi=
ng cifs mount
> > > >> >>>>>>>>>>> option 'user'
> > > >> >>>>>>>>>>> [ 4377.427047] CIFS: fs/cifs/cifsfs.c: Devname: \\chee=
kon\localnet flags: 0
> > > >> >>>>>>>>>>> [ 4377.427050] CIFS: fs/cifs/connect.c: Username: loca=
lnet
> > > >> >>>>>>>>>>> [ 4377.427052] CIFS: fs/cifs/connect.c: file mode: 075=
5  dir mode: 0755
> > > >> >>>>>>>>>>> [ 4377.427055] CIFS: fs/cifs/connect.c: VFS: in mount_=
get_conns as
> > > >> >>>>>>>>>>> Xid: 646 with uid: 0
> > > >> >>>>>>>>>>> [ 4377.427057] CIFS: fs/cifs/connect.c: UNC: \\cheekon=
\localnet
> > > >> >>>>>>>>>>> [ 4377.427060] CIFS: fs/cifs/connect.c: generic_ip_con=
nect: connecting
> > > >> >>>>>>>>>>> to 192.168.0.20:445
> > > >> >>>>>>>>>>> [ 4377.427067] CIFS: fs/cifs/connect.c: Socket created
> > > >> >>>>>>>>>>> [ 4377.427069] CIFS: fs/cifs/connect.c: sndbuf 16384 r=
cvbuf 131072
> > > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > > >> >>>>>>>>>>> [ 4377.428082] CIFS: fs/cifs/connect.c: cifs_get_tcp_s=
ession: next dns
> > > >> >>>>>>>>>>> resolution scheduled for 600 seconds in the future
> > > >> >>>>>>>>>>> [ 4377.428086] CIFS: fs/cifs/connect.c: VFS: in cifs_g=
et_smb_ses as
> > > >> >>>>>>>>>>> Xid: 647 with uid: 0
> > > >> >>>>>>>>>>> [ 4377.428089] CIFS: fs/cifs/connect.c: Existing smb s=
ess not found
> > > >> >>>>>>>>>>> [ 4377.428093] CIFS: fs/cifs/smb2pdu.c: Negotiate prot=
ocol
> > > >> >>>>>>>>>>> [ 4377.428093] CIFS: fs/cifs/connect.c: Demultiplex PI=
D: 77240
> > > >> >>>>>>>>>>> [ 4377.428098] CIFS: fs/cifs/transport.c: wait_for_fre=
e_credits:
> > > >> >>>>>>>>>>> remove 1 credits total=3D0
> > > >> >>>>>>>>>>> [ 4377.428113] CIFS: fs/cifs/transport.c: Sending smb:=
 smb_len=3D220
> > > >> >>>>>>>>>>> [ 4377.432265] CIFS: fs/cifs/connect.c: RFC1002 header=
 0x10c
> > > >> >>>>>>>>>>> [ 4377.432272] CIFS: fs/cifs/smb2misc.c: SMB2 data len=
gth 74 offset 128
> > > >> >>>>>>>>>>> [ 4377.432274] CIFS: fs/cifs/smb2misc.c: SMB2 len 202
> > > >> >>>>>>>>>>> [ 4377.432276] CIFS: fs/cifs/smb2misc.c: length of neg=
contexts 60 pad 6
> > > >> >>>>>>>>>>> [ 4377.432279] CIFS: fs/cifs/smb2ops.c: smb2_add_credi=
ts: added 1
> > > >> >>>>>>>>>>> credits total=3D1
> > > >> >>>>>>>>>>> [ 4377.432305] CIFS: fs/cifs/transport.c: cifs_sync_mi=
d_result: cmd=3D0
> > > >> >>>>>>>>>>> mid=3D0 state=3D4
> > > >> >>>>>>>>>>> [ 4377.432314] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4377.432317] CIFS: fs/cifs/smb2pdu.c: mode 0x1
> > > >> >>>>>>>>>>> [ 4377.432319] CIFS: fs/cifs/smb2pdu.c: negotiated smb=
3.1.1 dialect
> > > >> >>>>>>>>>>> [ 4377.432322] CIFS: fs/cifs/smb2pdu.c: decoding 2 neg=
otiate contexts
> > > >> >>>>>>>>>>> [ 4377.432324] CIFS: fs/cifs/smb2pdu.c: decode SMB3.11=
 encryption neg
> > > >> >>>>>>>>>>> context of len 4
> > > >> >>>>>>>>>>> [ 4377.432326] CIFS: fs/cifs/smb2pdu.c: SMB311 cipher =
type:2
> > > >> >>>>>>>>>>> [ 4377.432328] CIFS: fs/cifs/connect.c: Security Mode:=
 0x1
> > > >> >>>>>>>>>>> Capabilities: 0x300046 TimeAdjust: 0
> > > >> >>>>>>>>>>> [ 4377.432332] CIFS: fs/cifs/smb2pdu.c: Session Setup
> > > >> >>>>>>>>>>> [ 4377.432333] CIFS: fs/cifs/smb2pdu.c: sess setup typ=
e 2
> > > >> >>>>>>>>>>> [ 4377.432336] CIFS: fs/cifs/smb2pdu.c: Fresh session.=
 Previous: 0
> > > >> >>>>>>>>>>> [ 4377.432338] CIFS: fs/cifs/transport.c: wait_for_fre=
e_credits:
> > > >> >>>>>>>>>>> remove 1 credits total=3D0
> > > >> >>>>>>>>>>> [ 4377.432346] CIFS: fs/cifs/transport.c: Sending smb:=
 smb_len=3D136
> > > >> >>>>>>>>>>> [ 4377.433477] CIFS: fs/cifs/connect.c: RFC1002 header=
 0xda
> > > >> >>>>>>>>>>> [ 4377.433483] CIFS: fs/cifs/smb2misc.c: SMB2 data len=
gth 146 offset 72
> > > >> >>>>>>>>>>> [ 4377.433485] CIFS: fs/cifs/smb2misc.c: SMB2 len 218
> > > >> >>>>>>>>>>> [ 4377.433488] CIFS: fs/cifs/smb2ops.c: smb2_add_credi=
ts: added 1
> > > >> >>>>>>>>>>> credits total=3D1
> > > >> >>>>>>>>>>> [ 4377.433512] CIFS: fs/cifs/transport.c: cifs_sync_mi=
d_result: cmd=3D1
> > > >> >>>>>>>>>>> mid=3D1 state=3D4
> > > >> >>>>>>>>>>> [ 4377.433518] CIFS: Status code returned 0xc0000016
> > > >> >>>>>>>>>>> STATUS_MORE_PROCESSING_REQUIRED
> > > >> >>>>>>>>>>> [ 4377.433526] CIFS: fs/cifs/smb2maperror.c: Mapping S=
MB2 status code
> > > >> >>>>>>>>>>> 0xc0000016 to POSIX err -5
> > > >> >>>>>>>>>>> [ 4377.433531] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4377.433534] CIFS: fs/cifs/sess.c: decode_ntlmssp_ch=
allenge:
> > > >> >>>>>>>>>>> negotiate=3D0xe2088235 challenge=3D0xe28a8235
> > > >> >>>>>>>>>>> [ 4377.433536] CIFS: fs/cifs/smb2pdu.c: rawntlmssp ses=
sion setup challenge phase
> > > >> >>>>>>>>>>> [ 4377.433539] CIFS: fs/cifs/smb2pdu.c: Fresh session.=
 Previous: 0
> > > >> >>>>>>>>>>> [ 4377.433558] CIFS: fs/cifs/transport.c: wait_for_fre=
e_credits:
> > > >> >>>>>>>>>>> remove 1 credits total=3D0
> > > >> >>>>>>>>>>> [ 4377.433565] CIFS: fs/cifs/transport.c: Sending smb:=
 smb_len=3D320
> > > >> >>>>>>>>>>> [ 4377.446423] CIFS: fs/cifs/connect.c: RFC1002 header=
 0x48
> > > >> >>>>>>>>>>> [ 4377.446436] CIFS: fs/cifs/smb2misc.c: SMB2 data len=
gth 0 offset 72
> > > >> >>>>>>>>>>> [ 4377.446440] CIFS: fs/cifs/smb2misc.c: SMB2 len 73
> > > >> >>>>>>>>>>> [ 4377.446442] CIFS: fs/cifs/smb2misc.c: Calculated si=
ze 73 length 72
> > > >> >>>>>>>>>>> mismatch mid 2
> > > >> >>>>>>>>>>> [ 4377.446446] CIFS: fs/cifs/smb2ops.c: smb2_add_credi=
ts: added 130
> > > >> >>>>>>>>>>> credits total=3D130
> > > >> >>>>>>>>>>> [ 4377.446478] CIFS: fs/cifs/transport.c: cifs_sync_mi=
d_result: cmd=3D1
> > > >> >>>>>>>>>>> mid=3D2 state=3D4
> > > >> >>>>>>>>>>> [ 4377.446484] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4377.446499] CIFS: fs/cifs/smb2pdu.c: SMB2/3 session=
 established successfully
> > > >> >>>>>>>>>>> [ 4377.446502] CIFS: fs/cifs/sess.c: Cleared reconnect=
 bitmask for
> > > >> >>>>>>>>>>> chan 0; now 0x0
> > > >> >>>>>>>>>>> [ 4377.446505] CIFS: fs/cifs/connect.c: VFS: leaving c=
ifs_get_smb_ses
> > > >> >>>>>>>>>>> (xid =3D 647) rc =3D 0
> > > >> >>>>>>>>>>> [ 4377.446508] CIFS: fs/cifs/connect.c: VFS: in cifs_s=
etup_ipc as Xid:
> > > >> >>>>>>>>>>> 648 with uid: 0
> > > >> >>>>>>>>>>> [ 4377.446510] CIFS: fs/cifs/smb2pdu.c: TCON
> > > >> >>>>>>>>>>> [ 4377.446513] CIFS: fs/cifs/transport.c: wait_for_fre=
e_credits:
> > > >> >>>>>>>>>>> remove 1 credits total=3D129
> > > >> >>>>>>>>>>> [ 4377.446539] CIFS: fs/cifs/smb2ops.c: Encrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4377.446548] CIFS: fs/cifs/transport.c: Sending smb:=
 smb_len=3D158
> > > >> >>>>>>>>>>> [ 4377.455288] CIFS: fs/cifs/connect.c: RFC1002 header=
 0x84
> > > >> >>>>>>>>>>> [ 4377.455308] CIFS: fs/cifs/smb2ops.c: Decrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4377.455310] CIFS: fs/cifs/smb2ops.c: mid found
> > > >> >>>>>>>>>>> [ 4377.455312] CIFS: fs/cifs/smb2misc.c: SMB2 len 80
> > > >> >>>>>>>>>>> [ 4377.455315] CIFS: fs/cifs/smb2ops.c: smb2_add_credi=
ts: added 64
> > > >> >>>>>>>>>>> credits total=3D191
> > > >> >>>>>>>>>>> [ 4377.455344] CIFS: fs/cifs/transport.c: cifs_sync_mi=
d_result: cmd=3D3
> > > >> >>>>>>>>>>> mid=3D3 state=3D4
> > > >> >>>>>>>>>>> [ 4377.455349] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4377.455352] CIFS: fs/cifs/smb2pdu.c: connection to =
pipe share
> > > >> >>>>>>>>>>> [ 4377.455355] CIFS: fs/cifs/connect.c: VFS: leaving c=
ifs_setup_ipc
> > > >> >>>>>>>>>>> (xid =3D 648) rc =3D 0
> > > >> >>>>>>>>>>> [ 4377.455357] CIFS: fs/cifs/connect.c: IPC tcon rc =
=3D 0 ipc tid =3D -1798775872
> > > >> >>>>>>>>>>> [ 4377.455362] CIFS: fs/cifs/connect.c: VFS: in cifs_g=
et_tcon as Xid:
> > > >> >>>>>>>>>>> 649 with uid: 0
> > > >> >>>>>>>>>>> [ 4377.455364] CIFS: fs/cifs/smb2pdu.c: TCON
> > > >> >>>>>>>>>>> [ 4377.455367] CIFS: fs/cifs/transport.c: wait_for_fre=
e_credits:
> > > >> >>>>>>>>>>> remove 1 credits total=3D190
> > > >> >>>>>>>>>>> [ 4377.455376] CIFS: fs/cifs/smb2ops.c: Encrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4377.455384] CIFS: fs/cifs/transport.c: Sending smb:=
 smb_len=3D166
> > > >> >>>>>>>>>>> [ 4377.457328] CIFS: fs/cifs/connect.c: RFC1002 header=
 0x84
> > > >> >>>>>>>>>>> [ 4377.457341] CIFS: fs/cifs/smb2ops.c: Decrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4377.457343] CIFS: fs/cifs/smb2ops.c: mid found
> > > >> >>>>>>>>>>> [ 4377.457345] CIFS: fs/cifs/smb2misc.c: SMB2 len 80
> > > >> >>>>>>>>>>> [ 4377.457347] CIFS: fs/cifs/smb2ops.c: smb2_add_credi=
ts: added 64
> > > >> >>>>>>>>>>> credits total=3D254
> > > >> >>>>>>>>>>> [ 4377.457373] CIFS: fs/cifs/transport.c: cifs_sync_mi=
d_result: cmd=3D3
> > > >> >>>>>>>>>>> mid=3D4 state=3D4
> > > >> >>>>>>>>>>> [ 4377.457378] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4377.457380] CIFS: fs/cifs/smb2pdu.c: connection to =
disk share
> > > >> >>>>>>>>>>> [ 4377.457383] CIFS: fs/cifs/connect.c: VFS: leaving c=
ifs_get_tcon
> > > >> >>>>>>>>>>> (xid =3D 649) rc =3D 0
> > > >> >>>>>>>>>>> [ 4377.457385] CIFS: fs/cifs/connect.c: Tcon rc =3D 0
> > > >> >>>>>>>>>>> [ 4377.457388] CIFS: fs/cifs/smb2pdu.c: create/open
> > > >> >>>>>>>>>>> [ 4377.457391] CIFS: fs/cifs/transport.c: wait_for_fre=
e_credits:
> > > >> >>>>>>>>>>> remove 1 credits total=3D253
> > > >> >>>>>>>>>>> [ 4377.457400] CIFS: fs/cifs/smb2ops.c: Encrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4377.457407] CIFS: fs/cifs/transport.c: Sending smb:=
 smb_len=3D208
> > > >> >>>>>>>>>>> [ 4377.458319] CIFS: fs/cifs/connect.c: RFC1002 header=
 0x104
> > > >> >>>>>>>>>>> [ 4377.458331] CIFS: fs/cifs/smb2ops.c: Decrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4377.458333] CIFS: fs/cifs/smb2ops.c: mid found
> > > >> >>>>>>>>>>> [ 4377.458334] CIFS: fs/cifs/smb2misc.c: SMB2 data len=
gth 56 offset 152
> > > >> >>>>>>>>>>> [ 4377.458336] CIFS: fs/cifs/smb2misc.c: SMB2 len 208
> > > >> >>>>>>>>>>> [ 4377.458338] CIFS: fs/cifs/smb2ops.c: smb2_add_credi=
ts: added 10
> > > >> >>>>>>>>>>> credits total=3D263
> > > >> >>>>>>>>>>> [ 4377.458362] CIFS: fs/cifs/transport.c: cifs_sync_mi=
d_result: cmd=3D5
> > > >> >>>>>>>>>>> mid=3D5 state=3D4
> > > >> >>>>>>>>>>> [ 4377.458367] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4377.458371] CIFS: fs/cifs/smb2pdu.c: SMB2 IOCTL
> > > >> >>>>>>>>>>> [ 4377.458373] CIFS: fs/cifs/transport.c: wait_for_fre=
e_credits:
> > > >> >>>>>>>>>>> remove 1 credits total=3D262
> > > >> >>>>>>>>>>> [ 4377.458382] CIFS: fs/cifs/smb2ops.c: Encrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4377.458387] CIFS: fs/cifs/transport.c: Sending smb:=
 smb_len=3D177
> > > >> >>>>>>>>>>> [ 4377.459230] CIFS: fs/cifs/connect.c: RFC1002 header=
 0x4cc
> > > >> >>>>>>>>>>> [ 4377.459244] CIFS: fs/cifs/smb2ops.c: Decrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4377.459245] CIFS: fs/cifs/smb2ops.c: mid found
> > > >> >>>>>>>>>>> [ 4377.459247] CIFS: fs/cifs/smb2misc.c: SMB2 data len=
gth 1064 offset 112
> > > >> >>>>>>>>>>> [ 4377.459248] CIFS: fs/cifs/smb2misc.c: SMB2 len 1176
> > > >> >>>>>>>>>>> [ 4377.459250] CIFS: fs/cifs/smb2ops.c: smb2_add_credi=
ts: added 10
> > > >> >>>>>>>>>>> credits total=3D272
> > > >> >>>>>>>>>>> [ 4377.459274] CIFS: fs/cifs/transport.c: cifs_sync_mi=
d_result: cmd=3D11
> > > >> >>>>>>>>>>> mid=3D6 state=3D4
> > > >> >>>>>>>>>>> [ 4377.459282] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: adding iface 0
> > > >> >>>>>>>>>>> [ 4377.459284] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: speed
> > > >> >>>>>>>>>>> 10000000000 bps
> > > >> >>>>>>>>>>> [ 4377.459285] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces:
> > > >> >>>>>>>>>>> capabilities 0x00000001
> > > >> >>>>>>>>>>> [ 4377.459287] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: ipv4
> > > >> >>>>>>>>>>> 192.168.0.20
> > > >> >>>>>>>>>>> [ 4377.459289] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: adding iface 1
> > > >> >>>>>>>>>>> [ 4377.459290] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: speed
> > > >> >>>>>>>>>>> 10000000000 bps
> > > >> >>>>>>>>>>> [ 4377.459291] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces:
> > > >> >>>>>>>>>>> capabilities 0x00000001
> > > >> >>>>>>>>>>> [ 4377.459293] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: ipv6
> > > >> >>>>>>>>>>> fd40:1eef:5174:0000:f872:6d14:bade:233b
> > > >> >>>>>>>>>>> [ 4377.459294] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: adding iface 2
> > > >> >>>>>>>>>>> [ 4377.459296] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: speed
> > > >> >>>>>>>>>>> 10000000000 bps
> > > >> >>>>>>>>>>> [ 4377.459297] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces:
> > > >> >>>>>>>>>>> capabilities 0x00000001
> > > >> >>>>>>>>>>> [ 4377.459298] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: ipv6
> > > >> >>>>>>>>>>> fd40:1eef:5174:0000:7f90:c7fb:ffa7:a8dd
> > > >> >>>>>>>>>>> [ 4377.459299] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: adding iface 3
> > > >> >>>>>>>>>>> [ 4377.459300] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: speed
> > > >> >>>>>>>>>>> 10000000000 bps
> > > >> >>>>>>>>>>> [ 4377.459302] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces:
> > > >> >>>>>>>>>>> capabilities 0x00000001
> > > >> >>>>>>>>>>> [ 4377.459303] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: ipv6
> > > >> >>>>>>>>>>> 2001:0470:e1f3:0000:187d:e160:8517:e8df
> > > >> >>>>>>>>>>> [ 4377.459304] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: adding iface 4
> > > >> >>>>>>>>>>> [ 4377.459305] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: speed
> > > >> >>>>>>>>>>> 10000000000 bps
> > > >> >>>>>>>>>>> [ 4377.459307] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces:
> > > >> >>>>>>>>>>> capabilities 0x00000001
> > > >> >>>>>>>>>>> [ 4377.459308] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: ipv6
> > > >> >>>>>>>>>>> 2001:0470:e1f3:0000:11c8:9923:c250:1d0e
> > > >> >>>>>>>>>>> [ 4377.459309] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: adding iface 5
> > > >> >>>>>>>>>>> [ 4377.459310] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: speed
> > > >> >>>>>>>>>>> 1000000000 bps
> > > >> >>>>>>>>>>> [ 4377.459311] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces:
> > > >> >>>>>>>>>>> capabilities 0x00000000
> > > >> >>>>>>>>>>> [ 4377.459312] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: ipv4 127.0.0.1
> > > >> >>>>>>>>>>> [ 4377.459314] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: adding iface 6
> > > >> >>>>>>>>>>> [ 4377.459315] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: speed
> > > >> >>>>>>>>>>> 1000000000 bps
> > > >> >>>>>>>>>>> [ 4377.459317] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces:
> > > >> >>>>>>>>>>> capabilities 0x00000000
> > > >> >>>>>>>>>>> [ 4377.459318] CIFS: fs/cifs/smb2ops.c: parse_server_i=
nterfaces: ipv6
> > > >> >>>>>>>>>>> 0000:0000:0000:0000:0000:0000:0000:0001
> > > >> >>>>>>>>>>> [ 4377.459321] CIFS: fs/cifs/smb2pdu.c: Query FSInfo l=
evel 5
> > > >> >>>>>>>>>>> [ 4377.459324] CIFS: fs/cifs/transport.c: wait_for_fre=
e_credits:
> > > >> >>>>>>>>>>> remove 1 credits total=3D271
> > > >> >>>>>>>>>>> [ 4377.459332] CIFS: fs/cifs/smb2ops.c: Encrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4377.459337] CIFS: fs/cifs/transport.c: Sending smb:=
 smb_len=3D161
> > > >> >>>>>>>>>>> [ 4377.460257] CIFS: fs/cifs/connect.c: RFC1002 header=
 0x90
> > > >> >>>>>>>>>>> [ 4377.460267] CIFS: fs/cifs/smb2ops.c: Decrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4377.460269] CIFS: fs/cifs/smb2ops.c: mid found
> > > >> >>>>>>>>>>> [ 4377.460271] CIFS: fs/cifs/smb2misc.c: SMB2 data len=
gth 20 offset 72
> > > >> >>>>>>>>>>> [ 4377.460272] CIFS: fs/cifs/smb2misc.c: SMB2 len 92
> > > >> >>>>>>>>>>> [ 4377.460274] CIFS: fs/cifs/smb2ops.c: smb2_add_credi=
ts: added 10
> > > >> >>>>>>>>>>> credits total=3D281
> > > >> >>>>>>>>>>> [ 4377.460299] CIFS: fs/cifs/transport.c: cifs_sync_mi=
d_result: cmd=3D16
> > > >> >>>>>>>>>>> mid=3D7 state=3D4
> > > >> >>>>>>>>>>> [ 4377.460304] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4377.460306] CIFS: fs/cifs/smb2pdu.c: Query FSInfo l=
evel 4
> > > >> >>>>>>>>>>> [ 4377.460309] CIFS: fs/cifs/transport.c: wait_for_fre=
e_credits:
> > > >> >>>>>>>>>>> remove 1 credits total=3D280
> > > >> >>>>>>>>>>> [ 4377.460317] CIFS: fs/cifs/smb2ops.c: Encrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4377.460322] CIFS: fs/cifs/transport.c: Sending smb:=
 smb_len=3D161
> > > >> >>>>>>>>>>> [ 4377.461344] CIFS: fs/cifs/connect.c: RFC1002 header=
 0x84
> > > >> >>>>>>>>>>> [ 4377.461356] CIFS: fs/cifs/smb2ops.c: Decrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4377.461359] CIFS: fs/cifs/smb2ops.c: mid found
> > > >> >>>>>>>>>>> [ 4377.461361] CIFS: fs/cifs/smb2misc.c: SMB2 data len=
gth 8 offset 72
> > > >> >>>>>>>>>>> [ 4377.461363] CIFS: fs/cifs/smb2misc.c: SMB2 len 80
> > > >> >>>>>>>>>>> [ 4377.461366] CIFS: fs/cifs/smb2ops.c: smb2_add_credi=
ts: added 10
> > > >> >>>>>>>>>>> credits total=3D290
> > > >> >>>>>>>>>>> [ 4377.461393] CIFS: fs/cifs/transport.c: cifs_sync_mi=
d_result: cmd=3D16
> > > >> >>>>>>>>>>> mid=3D8 state=3D4
> > > >> >>>>>>>>>>> [ 4377.461399] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4377.461401] CIFS: fs/cifs/smb2pdu.c: Query FSInfo l=
evel 1
> > > >> >>>>>>>>>>> [ 4377.461403] CIFS: fs/cifs/transport.c: wait_for_fre=
e_credits:
> > > >> >>>>>>>>>>> remove 1 credits total=3D289
> > > >> >>>>>>>>>>> [ 4377.461412] CIFS: fs/cifs/smb2ops.c: Encrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4377.461418] CIFS: fs/cifs/transport.c: Sending smb:=
 smb_len=3D161
> > > >> >>>>>>>>>>> [ 4377.462309] CIFS: fs/cifs/connect.c: RFC1002 header=
 0x9e
> > > >> >>>>>>>>>>> [ 4377.462322] CIFS: fs/cifs/smb2ops.c: Decrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4377.462324] CIFS: fs/cifs/smb2ops.c: mid found
> > > >> >>>>>>>>>>> [ 4377.462326] CIFS: fs/cifs/smb2misc.c: SMB2 data len=
gth 34 offset 72
> > > >> >>>>>>>>>>> [ 4377.462329] CIFS: fs/cifs/smb2misc.c: SMB2 len 106
> > > >> >>>>>>>>>>> [ 4377.462332] CIFS: fs/cifs/smb2ops.c: smb2_add_credi=
ts: added 10
> > > >> >>>>>>>>>>> credits total=3D299
> > > >> >>>>>>>>>>> [ 4377.462358] CIFS: fs/cifs/transport.c: cifs_sync_mi=
d_result: cmd=3D16
> > > >> >>>>>>>>>>> mid=3D9 state=3D4
> > > >> >>>>>>>>>>> [ 4377.462363] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4377.462366] CIFS: fs/cifs/smb2pdu.c: Query FSInfo l=
evel 11
> > > >> >>>>>>>>>>> [ 4377.462376] CIFS: fs/cifs/smb2ops.c: Encrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4377.463243] CIFS: fs/cifs/smb2ops.c: Decrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4377.463248] CIFS: fs/cifs/smb2ops.c: mid found
> > > >> >>>>>>>>>>> [ 4377.463250] CIFS: fs/cifs/smb2misc.c: SMB2 data len=
gth 28 offset 72
> > > >> >>>>>>>>>>> [ 4377.463278] CIFS: fs/cifs/misc.c: Null buffer passe=
d to
> > > >> >>>>>>>>>>> cifs_small_buf_release
> > > >> >>>>>>>>>>> [ 4377.463283] CIFS: fs/cifs/smb2pdu.c: Close
> > > >> >>>>>>>>>>> [ 4377.463293] CIFS: fs/cifs/smb2ops.c: Encrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4377.464259] CIFS: fs/cifs/smb2ops.c: Decrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4377.464262] CIFS: fs/cifs/smb2ops.c: mid found
> > > >> >>>>>>>>>>> [ 4377.464291] CIFS: fs/cifs/dfs_cache.c: cache_refres=
h_path: search
> > > >> >>>>>>>>>>> path: \cheekon\localnet
> > > >> >>>>>>>>>>> [ 4377.464297] CIFS: fs/cifs/dfs_cache.c: get_dfs_refe=
rral: get an DFS
> > > >> >>>>>>>>>>> referral for \cheekon\localnet
> > > >> >>>>>>>>>>> [ 4377.464299] CIFS: fs/cifs/smb2ops.c: smb2_get_dfs_r=
efer: path:
> > > >> >>>>>>>>>>> \cheekon\localnet
> > > >> >>>>>>>>>>> [ 4377.464302] CIFS: fs/cifs/smb2pdu.c: SMB2 IOCTL
> > > >> >>>>>>>>>>> [ 4377.464311] CIFS: fs/cifs/smb2ops.c: Encrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4377.465280] CIFS: fs/cifs/smb2ops.c: Decrypt messag=
e returned 0
> > > >> >>>>>>>>>>> [ 4377.465286] CIFS: fs/cifs/smb2ops.c: mid found
> > > >> >>>>>>>>>>> [ 4377.465288] CIFS: fs/cifs/smb2misc.c: SMB2 data len=
gth 0 offset 0
> > > >> >>>>>>>>>>> [ 4377.465322] CIFS: Status code returned 0xc000019c S=
TATUS_FS_DRIVER_REQUIRED
> > > >> >>>>>>>>>>> [ 4377.465336] CIFS: fs/cifs/smb2maperror.c: Mapping S=
MB2 status code
> > > >> >>>>>>>>>>> 0xc000019c to POSIX err -95
> > > >> >>>>>>>>>>> [ 4377.465342] CIFS: fs/cifs/connect.c: is_path_remote=
: full_path:
> > > >> >>>>>>>>>>> [ 4377.465347] CIFS: fs/cifs/smb2pdu.c: create/open
> > > >> >>>>>>>>>>> [ 4377.466524] CIFS: fs/cifs/smb2pdu.c: Close
> > > >> >>>>>>>>>>> [ 4377.467607] CIFS: fs/cifs/smb2pdu.c: create/open
> > > >> >>>>>>>>>>> [ 4377.468787] CIFS: fs/cifs/smb2pdu.c: Close
> > > >> >>>>>>>>>>> [ 4377.469850] CIFS: fs/cifs/connect.c: VFS: leaving c=
ifs_mount (xid =3D
> > > >> >>>>>>>>>>> 646) rc =3D 0
> > > >> >>>>>>>>>>> [ 4377.469856] CIFS: fs/cifs/sess.c: ses already at ma=
x_channels (1),
> > > >> >>>>>>>>>>> nothing to open
> > > >> >>>>>>>>>>> [ 4377.470004] CIFS: fs/cifs/inode.c: VFS: in cifs_roo=
t_iget as Xid:
> > > >> >>>>>>>>>>> 650 with uid: 0
> > > >> >>>>>>>>>>> [ 4377.471323] CIFS: fs/cifs/smb2misc.c: Calculated si=
ze 208 length
> > > >> >>>>>>>>>>> 512 mismatch mid 17
> > > >> >>>>>>>>>>> [ 4377.471344] CIFS: fs/cifs/smb2misc.c: Calculated si=
ze 174 length
> > > >> >>>>>>>>>>> 512 mismatch mid 18
> > > >> >>>>>>>>>>> [ 4377.471347] CIFS: fs/cifs/smb2misc.c: Calculated si=
ze 124 length
> > > >> >>>>>>>>>>> 512 mismatch mid 19
> > > >> >>>>>>>>>>> [ 4377.471395] CIFS: fs/cifs/smb2ops.c: get smb3 acl f=
or path
> > > >> >>>>>>>>>>> [ 4377.471403] CIFS: fs/cifs/smb2ops.c: VFS: in get_sm=
b2_acl_by_path
> > > >> >>>>>>>>>>> as Xid: 651 with uid: 0
> > > >> >>>>>>>>>>> [ 4377.471409] CIFS: fs/cifs/smb2pdu.c: create/open
> > > >> >>>>>>>>>>> [ 4377.472632] CIFS: fs/cifs/smb2pdu.c: Query Info
> > > >> >>>>>>>>>>> [ 4377.473671] CIFS: fs/cifs/smb2pdu.c: Close
> > > >> >>>>>>>>>>> [ 4377.474729] CIFS: fs/cifs/smb2ops.c: VFS: leaving
> > > >> >>>>>>>>>>> get_smb2_acl_by_path (xid =3D 651) rc =3D 0
> > > >> >>>>>>>>>>> [ 4377.474733] CIFS: fs/cifs/smb2ops.c: get_smb2_acl_b=
y_path: rc =3D 0 ACL len 312
> > > >> >>>>>>>>>>> [ 4377.477086] CIFS: fs/cifs/cifsacl.c: sid_to_id: Can=
't map SID
> > > >> >>>>>>>>>>> os:S-1-5-21-122774138-3582407017-3610500266-1001 to a =
uid
> > > >> >>>>>>>>>>> [ 4377.478800] CIFS: fs/cifs/cifsacl.c: sid_to_id: Can=
't map SID
> > > >> >>>>>>>>>>> gs:S-1-22-2-1001 to a gid
> > > >> >>>>>>>>>>> [ 4377.478809] CIFS: fs/cifs/inode.c: looking for uniq=
ueid=3D263248
> > > >> >>>>>>>>>>> [ 4377.478821] CIFS: fs/cifs/inode.c: cifs_revalidate_=
cache:
> > > >> >>>>>>>>>>> revalidating inode 263248
> > > >> >>>>>>>>>>> [ 4377.478823] CIFS: fs/cifs/inode.c: cifs_revalidate_=
cache: inode 263248 is new
> > > >> >>>>>>>>>>> [ 4377.478826] CIFS: fs/cifs/inode.c: VFS: leaving cif=
s_root_iget (xid
> > > >> >>>>>>>>>>> =3D 650) rc =3D 0
> > > >> >>>>>>>>>>> [ 4377.478830] CIFS: fs/cifs/cifsfs.c: Get root dentry=
 for
> > > >> >>>>>>>>>>> [ 4377.478832] CIFS: fs/cifs/cifsfs.c: dentry root is:=
 0000000095b05357
> > > >> >>>>>>>>>>> [ 4377.480027] CIFS: fs/cifs/dir.c: VFS: in cifs_looku=
p as Xid: 652
> > > >> >>>>>>>>>>> with uid: 1000
> > > >> >>>>>>>>>>> [ 4377.480033] CIFS: fs/cifs/dir.c: parent inode =3D 0=
x00000000cc8fcd81
> > > >> >>>>>>>>>>> name is: .Trash and dentry =3D 0x000000001bf85909
> > > >> >>>>>>>>>>> [ 4377.480039] CIFS: fs/cifs/dir.c: NULL inode in look=
up
> > > >> >>>>>>>>>>> [ 4377.480041] CIFS: fs/cifs/dir.c: Full path: \.Trash=
 inode =3D
> > > >> >>>>>>>>>>> 0x0000000000000000
> > > >> >>>>>>>>>>> [ 4377.481529] CIFS: fs/cifs/cifsfs.c: VFS: in cifs_st=
atfs as Xid: 653
> > > >> >>>>>>>>>>> with uid: 1000
> > > >> >>>>>>>>>>> [ 4377.481861] CIFS: fs/cifs/smb2misc.c: Calculated si=
ze 73 length 240
> > > >> >>>>>>>>>>> mismatch mid 23
> > > >> >>>>>>>>>>> [ 4377.481867] CIFS: fs/cifs/smb2misc.c: Calculated si=
ze 73 length 240
> > > >> >>>>>>>>>>> mismatch mid 24
> > > >> >>>>>>>>>>> [ 4377.481870] CIFS: fs/cifs/smb2misc.c: Calculated si=
ze 73 length 240
> > > >> >>>>>>>>>>> mismatch mid 25
> > > >> >>>>>>>>>>> [ 4377.481885] CIFS: Status code returned 0xc0000034
> > > >> >>>>>>>>>>> STATUS_OBJECT_NAME_NOT_FOUND
> > > >> >>>>>>>>>>> [ 4377.481893] CIFS: fs/cifs/smb2maperror.c: Mapping S=
MB2 status code
> > > >> >>>>>>>>>>> 0xc0000034 to POSIX err -2
> > > >> >>>>>>>>>>> [ 4377.481901] CIFS: fs/cifs/inode.c: cifs_get_inode_i=
nfo: unhandled err rc -2
> > > >> >>>>>>>>>>> [ 4377.481905] CIFS: fs/cifs/dir.c: VFS: leaving cifs_=
lookup (xid =3D 652) rc =3D -2
> > > >> >>>>>>>>>>> [ 4377.481957] CIFS: fs/cifs/dir.c: VFS: in cifs_looku=
p as Xid: 654
> > > >> >>>>>>>>>>> with uid: 1000
> > > >> >>>>>>>>>>> [ 4377.481960] CIFS: fs/cifs/dir.c: parent inode =3D 0=
x00000000cc8fcd81
> > > >> >>>>>>>>>>> name is: .Trash-1000 and dentry =3D 0x000000007d3b3552
> > > >> >>>>>>>>>>> [ 4377.481966] CIFS: fs/cifs/dir.c: NULL inode in look=
up
> > > >> >>>>>>>>>>> [ 4377.481967] CIFS: fs/cifs/dir.c: Full path: \.Trash=
-1000 inode =3D
> > > >> >>>>>>>>>>> 0x0000000000000000
> > > >> >>>>>>>>>>> [ 4377.483453] CIFS: fs/cifs/smb2misc.c: Calculated si=
ze 208 length
> > > >> >>>>>>>>>>> 440 mismatch mid 26
> > > >> >>>>>>>>>>> [ 4377.483463] CIFS: fs/cifs/smb2misc.c: Calculated si=
ze 104 length
> > > >> >>>>>>>>>>> 440 mismatch mid 27
> > > >> >>>>>>>>>>> [ 4377.483466] CIFS: fs/cifs/smb2misc.c: Calculated si=
ze 124 length
> > > >> >>>>>>>>>>> 440 mismatch mid 28
> > > >> >>>>>>>>>>> [ 4377.483491] CIFS: fs/cifs/cifsfs.c: VFS: leaving ci=
fs_statfs (xid =3D
> > > >> >>>>>>>>>>> 653) rc =3D 0
> > > >> >>>>>>>>>>> [ 4377.484901] CIFS: Status code returned 0xc0000034
> > > >> >>>>>>>>>>> STATUS_OBJECT_NAME_NOT_FOUND
> > > >> >>>>>>>>>>> [ 4377.484908] CIFS: fs/cifs/smb2maperror.c: Mapping S=
MB2 status code
> > > >> >>>>>>>>>>> 0xc0000034 to POSIX err -2
> > > >> >>>>>>>>>>> [ 4377.484913] CIFS: fs/cifs/inode.c: cifs_get_inode_i=
nfo: unhandled err rc -2
> > > >> >>>>>>>>>>> [ 4377.484916] CIFS: fs/cifs/dir.c: VFS: leaving cifs_=
lookup (xid =3D 654) rc =3D -2
> > > >> >>>>>>>>>>>
> > > >> >>>>>>>>>>>
> > > >> >>>>>>>>>>>
> > > >> >>>>>>>>>>> On Fri, Mar 4, 2022 at 9:01 AM Satadru Pramanik <satad=
ru@gmail.com> wrote:
> > > >> >>>>>>>>>>>>
> > > >> >>>>>>>>>>>> Here is a subset of the recent dmesg during failed mo=
unts, followed by
> > > >> >>>>>>>>>>>> an unmount and remount.
> > > >> >>>>>>>>>>>>
> > > >> >>>>>>>>>>>> On Fri, Mar 4, 2022 at 8:58 AM Satadru Pramanik <sata=
dru@gmail.com> wrote:
> > > >> >>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>> I have put this in my /etc/rc.local:
> > > >> >>>>>>>>>>>>> echo 'module cifs +p' > /sys/kernel/debug/dynamic_de=
bug/control
> > > >> >>>>>>>>>>>>> echo 'file fs/cifs/* +p' > /sys/kernel/debug/dynamic=
_debug/control
> > > >> >>>>>>>>>>>>> echo 7 > /proc/fs/cifs/cifsFYI
> > > >> >>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>> I ran the commands again manually, and the attached =
dmesg appears to
> > > >> >>>>>>>>>>>>> be capturing some of the aforementioned reconnection=
 efforts this
> > > >> >>>>>>>>>>>>> morning.
> > > >> >>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>> On Fri, Mar 4, 2022 at 12:49 AM Shyam Prasad N <nspm=
angalore@gmail.com> wrote:
> > > >> >>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>> On Wed, Mar 2, 2022 at 8:16 PM Satadru Pramanik <sa=
tadru@gmail.com> wrote:
> > > >> >>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>> Here is also the dmesg as promised. (After resumin=
g from suspend/sleep
> > > >> >>>>>>>>>>>>>>> this morning, when I again had the same issue.)
> > > >> >>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>> On Wed, Mar 2, 2022 at 2:57 AM Shyam Prasad N <nsp=
mangalore@gmail.com> wrote:
> > > >> >>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>> On Wed, Mar 2, 2022 at 3:51 AM Satadru Pramanik <=
satadru@gmail.com> wrote:
> > > >> >>>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>>> I have put the trace.dat and other debug files h=
ere since I can not
> > > >> >>>>>>>>>>>>>>>>> attach the files to a message to the list. (Appa=
rently the trace.dat
> > > >> >>>>>>>>>>>>>>>>> file is too large.)
> > > >> >>>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>>> https://drive.google.com/drive/folders/1wEi968Rb=
XxivXMMH8J7XUsHhrxu9OWDX?usp=3Dsharing
> > > >> >>>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>>> On Mon, Feb 28, 2022 at 11:12 PM Satadru Pramani=
k <satadru@gmail.com> wrote:
> > > >> >>>>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>>>> The trace.dat file is attached, covering the pe=
riod before suspend,
> > > >> >>>>>>>>>>>>>>>>>> and through wake several hours later, when the =
mount no longer worked,
> > > >> >>>>>>>>>>>>>>>>>> and showed the CIFS: VFS: cifs_tree_connect: co=
uld not find
> > > >> >>>>>>>>>>>>>>>>>> superblock: -22 message, and through when I unm=
ounted and remounted
> > > >> >>>>>>>>>>>>>>>>>> the share, which then started working.
> > > >> >>>>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>>>> On Mon, Feb 28, 2022 at 9:31 AM Satadru Pramani=
k <satadru@gmail.com> wrote:
> > > >> >>>>>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>>>>> Here is the DebugData from before and after fr=
om the system with the
> > > >> >>>>>>>>>>>>>>>>>>> failed mount.
> > > >> >>>>>>>>>>>>>>>>>>> Both systems are now running 5.17-rc6.
> > > >> >>>>>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>>>>> Working on the trace-cmd now.
> > > >> >>>>>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>>>>> On Sun, Feb 27, 2022 at 9:37 PM Steve French <=
smfrench@gmail.com> wrote:
> > > >> >>>>>>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>>>>>> I would like to see the output of:
> > > >> >>>>>>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>>>>>> /proc/fs/cifs/DebugData before and after the =
failure if possible.
> > > >> >>>>>>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>>>>>> In addition, there would be some value in see=
ing trace information
> > > >> >>>>>>>>>>>>>>>>>>>> (e.g start tracing by
> > > >> >>>>>>>>>>>>>>>>>>>> "trace-cmd record -e cifs" before the failure=
 and then forward the
> > > >> >>>>>>>>>>>>>>>>>>>> debug information displayed by "trace-cmd sho=
w" after the failure)
> > > >> >>>>>>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>>>>>> On Sun, Feb 27, 2022 at 7:55 AM Thorsten Leem=
huis
> > > >> >>>>>>>>>>>>>>>>>>>> <regressions@leemhuis.info> wrote:
> > > >> >>>>>>>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>>>>>>> [TLDR: I'm adding the regression report belo=
w to regzbot, the Linux
> > > >> >>>>>>>>>>>>>>>>>>>>> kernel regression tracking bot; all text you=
 find below is compiled from
> > > >> >>>>>>>>>>>>>>>>>>>>> a few templates paragraphs you might have en=
countered already already
> > > >> >>>>>>>>>>>>>>>>>>>>> from similar mails.]
> > > >> >>>>>>>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>>>>>>> Hi, this is your Linux kernel regression tra=
cker. Top-posting for once,
> > > >> >>>>>>>>>>>>>>>>>>>>> to make this easily accessible to everyone.
> > > >> >>>>>>>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>>>>>>> CCing the regression mailing list, as it sho=
uld be in the loop for all
> > > >> >>>>>>>>>>>>>>>>>>>>> regressions, as explained here:
> > > >> >>>>>>>>>>>>>>>>>>>>> https://www.kernel.org/doc/html/latest/admin=
-guide/reporting-issues.html
> > > >> >>>>>>>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>>>>>>> To be sure below issue doesn't fall through =
the cracks unnoticed, I'm
> > > >> >>>>>>>>>>>>>>>>>>>>> adding it to regzbot, my Linux kernel regres=
sion tracking bot:
> > > >> >>>>>>>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>>>>>>> #regzbot ^introduced v5.16.11..v5.17-rc5
> > > >> >>>>>>>>>>>>>>>>>>>>> #regzbot title cifs: Failure to access cifs =
mount of samba share after
> > > >> >>>>>>>>>>>>>>>>>>>>> resume from sleep
> > > >> >>>>>>>>>>>>>>>>>>>>> #regzbot ignore-activity
> > > >> >>>>>>>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>>>>>>> Reminder for developers: when fixing the iss=
ue, please add a 'Link:'
> > > >> >>>>>>>>>>>>>>>>>>>>> tags pointing to the report (the mail quoted=
 above) using
> > > >> >>>>>>>>>>>>>>>>>>>>> lore.kernel.org/r/, as explained in
> > > >> >>>>>>>>>>>>>>>>>>>>> 'Documentation/process/submitting-patches.rs=
t' and
> > > >> >>>>>>>>>>>>>>>>>>>>> 'Documentation/process/5.Posting.rst'. This =
allows the bot to connect
> > > >> >>>>>>>>>>>>>>>>>>>>> the report with any patches posted or commit=
ted to fix the issue; this
> > > >> >>>>>>>>>>>>>>>>>>>>> again allows the bot to show the current sta=
tus of regressions and
> > > >> >>>>>>>>>>>>>>>>>>>>> automatically resolve the issue when the fix=
 hits the right tree.
> > > >> >>>>>>>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>>>>>>> I'm sending this to everyone that got the in=
itial report, to make them
> > > >> >>>>>>>>>>>>>>>>>>>>> aware of the tracking. I also hope that mess=
ages like this motivate
> > > >> >>>>>>>>>>>>>>>>>>>>> people to directly get at least the regressi=
on mailing list and ideally
> > > >> >>>>>>>>>>>>>>>>>>>>> even regzbot involved when dealing with regr=
essions, as messages like
> > > >> >>>>>>>>>>>>>>>>>>>>> this wouldn't be needed then. And don't worr=
y, if I need to send other
> > > >> >>>>>>>>>>>>>>>>>>>>> mails regarding this regression only relevan=
t for regzbot I'll send them
> > > >> >>>>>>>>>>>>>>>>>>>>> to the regressions lists only (with a tag in=
 the subject so people can
> > > >> >>>>>>>>>>>>>>>>>>>>> filter them away). With a bit of luck no suc=
h messages will be needed
> > > >> >>>>>>>>>>>>>>>>>>>>> anyway.
> > > >> >>>>>>>>>>>>>>>>>>>>>
> > > >> >>>>>>>>>>>>>>>>>>>>> Ciao, Thorsten (wearing his 'the Linux kerne=
l's regression tracker' hat)
> > > >> >
> > > >> >
> > > >> >
> > >
> > >
> > >
> > > --
> > > Regards,
> > > Shyam
>
>
>
> --
> Thanks,
>
> Steve

--00000000000048928905dca676b7
Content-Type: application/gzip; name="dmesg.numericip.manualmount2.txt.gz"
Content-Disposition: attachment; 
	filename="dmesg.numericip.manualmount2.txt.gz"
Content-Transfer-Encoding: base64
Content-ID: <f_l1zovj4t0>
X-Attachment-Id: f_l1zovj4t0

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
HD0t5P8D4zEgtQi6AgA=
--00000000000048928905dca676b7--
