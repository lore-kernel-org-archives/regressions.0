Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95707A
	for <regressions@lists.linux.dev>; Thu, 14 Apr 2022 15:22:23 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id a14so1814753uan.9
        for <regressions@lists.linux.dev>; Thu, 14 Apr 2022 08:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h5euh5SmXrlhf180WoJwkY5ozyu8wBQSsKibr5O0e5c=;
        b=C/SwmizcMEAYcJiueZB/koO7Qep3+0XAuGdtpOmT05SNPZ5d9A3f5E3mPbU3krvEEn
         Pk0e3U8Z+c/qoI4CyBYvJ3GJZ3LM3WgAiNC64+nz+o2hpIyJSwsMjfpeonG+r8Okx3wu
         FQG9f2F3S+Sj0NWwEnJIIeTKvbu5+75yNnoVfKWjtiCVjQYTMXJwj/36fbj6I4ncAAHx
         llWr4KJ7MCWvQve/cenqisxrBdmqNw4xUgZr1R52E4V67NW74t2Y09f26vyUIEdVg3VN
         vyWQ/jHGcRbUGnqlfpD/lGRKl8jfWqURpRdH1JLv07gOSJjGqVEfXsDTzT5Ts2NYLF6H
         +N7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h5euh5SmXrlhf180WoJwkY5ozyu8wBQSsKibr5O0e5c=;
        b=Lqcv4fvSJbDd7TB7FQBzVyHJ/GhC85VFUtJFMlPJX1cv4eFO6NsCzrTk91Rz6/mohc
         2aXFnWECaHS5eBi95a73mRo/i0zzAHkakTw8VNnTYGylsTNsaoslekwo2LGLbs+Ens1G
         Uvr0U6a90JCZnrWAAGXWTCcgYFYq/YjAlKAbtZXq/YxYrik3Cb5riMfCMMbJg1JeRCd1
         XN5aLLRyBKPVlqZxze3Dp0K+iwcwK8bm2qH0roclp4b7asSVUyRJhqAH3/m8ZAYeni37
         PF3u3MHbpTwokEUyCrSjAm5BG724r1R2CmqTDUkcIrJQxFFcc4X44JRm0vEgEmgdsayk
         kxwA==
X-Gm-Message-State: AOAM530Oz6GtWXFW6tdasSn1wzXhynSVzPl3nGvn9IkN6GZROxtU/1vD
	3GhH0yMT2XZ7E3X7qn68b1xyRLDKN+p3FrhTHXh50QO1
X-Google-Smtp-Source: ABdhPJzZOSwpvDnJSo7QxIwO2Yiwnlg14kqaixFlbM3KbyXXyb+/hv1vMfduzCgsmFoGln3okiX+zCGc490Xmm+C8Hc=
X-Received: by 2002:ab0:4504:0:b0:351:2448:a093 with SMTP id
 r4-20020ab04504000000b003512448a093mr981037uar.121.1649949741814; Thu, 14 Apr
 2022 08:22:21 -0700 (PDT)
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
 <CANT5p=rNqC+BO0yhSh+RK1x8rbVUSxRyeB3GJEpshhggx_n_iQ@mail.gmail.com> <CAFrh3J8nNfbxS86bHa7bsSo5eT3nD=jALTCVQcyqCepGQYYGaQ@mail.gmail.com>
In-Reply-To: <CAFrh3J8nNfbxS86bHa7bsSo5eT3nD=jALTCVQcyqCepGQYYGaQ@mail.gmail.com>
From: Satadru Pramanik <satadru@gmail.com>
Date: Thu, 14 Apr 2022 11:22:10 -0400
Message-ID: <CAFrh3J_PQ6LrKhdy=OHOFNnzei=B+J-HViM6d+Q9C_i3ceuXPg@mail.gmail.com>
Subject: Re: Failure to access cifs mount of samba share after resume from
 sleep with 5.17-rc5
To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, ronnie sahlberg <ronniesahlberg@gmail.com>, 
	Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>, 
	regressions@lists.linux.dev
Content-Type: multipart/mixed; boundary="000000000000427e5805dc9edc19"

--000000000000427e5805dc9edc19
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

And this is from doing the same thing, albeit with the hostname
specified as an IP address and not a name to be resolved.

On Thu, Apr 14, 2022 at 11:14 AM Satadru Pramanik <satadru@gmail.com> wrote=
:
>
> FYI I can not switch on cifsFYI before doing the initial mount.
>
> I get this error:
> echo 7 > /proc/fs/cifs/cifsFYI
> bash: /proc/fs/cifs/cifsFYI: No such file or directory
>
> So I mounted, enabled cifsFYI, unmounted, remounted the cifs volume
> manually, put the laptop to sleep, rebooted the server, and then got
> the error.
>
> The dmesg is attached.
>
> Regards,
> Satadru
>
> On Wed, Apr 13, 2022 at 11:48 PM Shyam Prasad N <nspmangalore@gmail.com> =
wrote:
> >
> > Hi Satadru,
> >
> > Can you please send the full cifsFYI logs with manual mount? Please
> > switch on cifsFYI before you mount the share.
> >
> > On Tue, Apr 12, 2022 at 1:40 AM Satadru Pramanik <satadru@gmail.com> wr=
ote:
> > >
> > > Both tests resulted in similar failures (removing the mount from fsta=
b and switching the mount to an IP address vs a hostname.)
> > >
> > > I'll compile 5.18-rc2 and see if I have the same issues.
> > >
> > > On Mon, Apr 11, 2022 at 6:29 AM Thorsten Leemhuis <regressions@leemhu=
is.info> wrote:
> > >>
> > >> Hi, this is your Linux kernel regression tracker. Top-posting for on=
ce,
> > >> to make this easily accessible to everyone.
> > >>
> > >> What's the status here?
> > >>
> > >> Satadru, did you do the tests?
> > >>
> > >> Shyam: or where you or somebody else able to address this aleady?
> > >>
> > >> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' =
hat)
> > >>
> > >> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
> > >> reports on my table. I can only look briefly into most of them and l=
ack
> > >> knowledge about most of the areas they concern. I thus unfortunately
> > >> will sometimes get things wrong or miss something important. I hope
> > >> that's not the case here; if you think it is, don't hesitate to tell=
 me
> > >> in a public reply, it's in everyone's interest to set the public rec=
ord
> > >> straight.
> > >>
> > >> #regzbot poke
> > >>
> > >> On 18.03.22 15:05, Shyam Prasad N wrote:
> > >> > Thanks for the update. No worries.
> > >> >
> > >> > On Fri, Mar 18, 2022 at 7:30 PM Satadru Pramanik <satadru@gmail.co=
m> wrote:
> > >> >>
> > >> >> I can do those tests on March 27th when I return to my setup in N=
Y. The hostname "cheekon" is indeed resolved either locally to a RFC1918 ad=
dress via the LAN DNS server or to an IPv6 address via other DNS servers, a=
ssuming the host has picked up the domain search suffix via DHCP. The lapto=
p is running the stock Ubuntu 22.04 DNS resolution setup, which I believe i=
s systemd-resolved.
> > >> >>
> > >> >> I apologize for being unable to help troubleshoot this issue agai=
n before I get back, as I am on a trip with family, and did not lug the Ubu=
ntu laptop (and server) with me.
> > >> >>
> > >> >> Regards,
> > >> >> Satadru
> > >> >>
> > >> >> On Fri, Mar 18, 2022, 4:05 AM Shyam Prasad N <nspmangalore@gmail.=
com> wrote:
> > >> >>>
> > >> >>> Hi Satadru,
> > >> >>>
> > >> >>> For the sleep/resume issue:
> > >> >>> After going through the logs in detail, I could see that cifs.ko=
 is
> > >> >>> mostly behaving the way it should be. I could see that a reconne=
ct was
> > >> >>> triggered, and that also worked fine for the most part.
> > >> >>> The only issue is that the superblock is missing. I'm trying to
> > >> >>> understand what led to that.
> > >> >>>
> > >> >>> You mentioned that you have the mount setup as an fstab entry. I=
f it
> > >> >>> is possible, can you repeat the same experiment with this entry
> > >> >>> removed from fstab.
> > >> >>> Also as another experiment, can you replace the hostname (cheeko=
n)
> > >> >>> with the corresponding IP address and repeat the same experiment=
. (I
> > >> >>> could see "failed to resolve hostname" logs from some of your ea=
rlier
> > >> >>> logs after resume).
> > >> >>>
> > >> >>> I have a feeling that one of these two factors is exposing this =
bug in cifs.ko.
> > >> >>>
> > >> >>> For the samba server restart issue, I could see from the logs th=
at you
> > >> >>> pasted that your I/O process was pending a signal. This was the =
reason
> > >> >>> that the I/O kept returning errno 512 (ERESTARTSYS).
> > >> >>>
> > >> >>> Hi Thorsten,
> > >> >>> Based on my investigations above, I believe that the way Satadru=
's
> > >> >>> laptop is setup has exposed a bug that we're finding it hard to
> > >> >>> reproduce.
> > >> >>> I think that the above experiments that I suggested will help na=
rrow
> > >> >>> down the problem and take us closer to root causing the issue.
> > >> >>>
> > >> >>> Regards,
> > >> >>> Shyam
> > >> >>>
> > >> >>> On Wed, Mar 16, 2022 at 10:57 PM Satadru Pramanik <satadru@gmail=
.com> wrote:
> > >> >>>>
> > >> >>>> I am unable to mount a cifs volume with that patch reversed.
> > >> >>>> This is what dmesg shows:
> > >> >>>> [  242.560881] INFO: task mount.smb3:3219 blocked for more than=
 120 seconds.
> > >> >>>> [  242.560901]       Tainted: P           OE
> > >> >>>> 5.17.0-051700rc8-generic #202203132130
> > >> >>>> [  242.560904] "echo 0 > /proc/sys/kernel/hung_task_timeout_sec=
s"
> > >> >>>> disables this message.
> > >> >>>> [  242.560907] task:mount.smb3      state:D stack:    0 pid: 32=
19
> > >> >>>> ppid:     1 flags:0x00004006
> > >> >>>> [  242.560914] Call Trace:
> > >> >>>> [  242.560918]  <TASK>
> > >> >>>> [  242.560927]  __schedule+0x240/0x5a0
> > >> >>>> [  242.560939]  schedule+0x55/0xd0
> > >> >>>> [  242.560941]  schedule_preempt_disabled+0x15/0x20
> > >> >>>> [  242.560944]  __mutex_lock.constprop.0+0x2e0/0x4b0
> > >> >>>> [  242.560949]  __mutex_lock_slowpath+0x13/0x20
> > >> >>>> [  242.560953]  mutex_lock+0x34/0x40
> > >> >>>> [  242.560958]  cifs_get_smb_ses+0x367/0xab0 [cifs]
> > >> >>>> [  242.561108]  ? __queue_delayed_work+0x5c/0x90
> > >> >>>> [  242.561120]  mount_get_conns+0x63/0x430 [cifs]
> > >> >>>> [  242.561182]  cifs_mount+0x86/0x420 [cifs]
> > >> >>>> [  242.561222]  cifs_smb3_do_mount+0x10d/0x320 [cifs]
> > >> >>>> [  242.561252]  ? cifs_smb3_do_mount+0x10d/0x320 [cifs]
> > >> >>>> [  242.561283]  ? vfs_parse_fs_string+0x7f/0xb0
> > >> >>>> [  242.561290]  smb3_get_tree+0x3e/0x70 [cifs]
> > >> >>>> [  242.561337]  vfs_get_tree+0x27/0xc0
> > >> >>>> [  242.561343]  do_new_mount+0x14b/0x1a0
> > >> >>>> [  242.561348]  path_mount+0x1d4/0x530
> > >> >>>> [  242.561350]  ? putname+0x55/0x60
> > >> >>>> [  242.561357]  __x64_sys_mount+0x108/0x140
> > >> >>>> [  242.561360]  do_syscall_64+0x59/0xc0
> > >> >>>> [  242.561368]  ? do_syscall_64+0x69/0xc0
> > >> >>>> [  242.561372]  ? handle_mm_fault+0xba/0x290
> > >> >>>> [  242.561376]  ? do_user_addr_fault+0x1dd/0x670
> > >> >>>> [  242.561382]  ? syscall_exit_to_user_mode+0x27/0x50
> > >> >>>> [  242.561385]  ? exit_to_user_mode_prepare+0x37/0xb0
> > >> >>>> [  242.561392]  ? irqentry_exit_to_user_mode+0x9/0x20
> > >> >>>> [  242.561394]  ? irqentry_exit+0x33/0x40
> > >> >>>> [  242.561397]  ? exc_page_fault+0x89/0x180
> > >> >>>> [  242.561399]  ? asm_exc_page_fault+0x8/0x30
> > >> >>>> [  242.561405]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > >> >>>> [  242.561409] RIP: 0033:0x7f42af11ceae
> > >> >>>> [  242.561414] RSP: 002b:00007fff6af66c48 EFLAGS: 00000206 ORIG=
_RAX:
> > >> >>>> 00000000000000a5
> > >> >>>> [  242.561418] RAX: ffffffffffffffda RBX: 000055dcbe40beb0 RCX:=
 00007f42af11ceae
> > >> >>>> [  242.561420] RDX: 000055dcbe1a447e RSI: 000055dcbe1a44da RDI:=
 00007fff6af67ea6
> > >> >>>> [  242.561421] RBP: 0000000000000000 R08: 000055dcbe40beb0 R09:=
 000055dcbe40cf40
> > >> >>>> [  242.561423] R10: 0000000000000000 R11: 0000000000000206 R12:=
 00007fff6af67e9b
> > >> >>>> [  242.561424] R13: 00007f42af237000 R14: 00007f42af23990f R15:=
 000055dcbe40cf40
> > >> >>>> [  242.561427]  </TASK>
> > >> >>>>
> > >> >>>> On Wed, Mar 16, 2022 at 9:22 AM Satadru Pramanik <satadru@gmail=
.com> wrote:
> > >> >>>>>
> > >> >>>>> I will try that.
> > >> >>>>>
> > >> >>>>> On Wed, Mar 16, 2022 at 1:27 AM ronnie sahlberg
> > >> >>>>> <ronniesahlberg@gmail.com> wrote:
> > >> >>>>>>
> > >> >>>>>> I have analyzed the patch Steve bisected and we have figured =
out why
> > >> >>>>>> it breaks multiuser mounts.
> > >> >>>>>> (It basically assumes there is a 1-to-1 correlation between t=
wo
> > >> >>>>>> structures in the kernel while for multiuser it is actually a=
 1-n and
> > >> >>>>>> we tracked important state information for 'n' in the '1' str=
ucture
> > >> >>>>>> :-( )
> > >> >>>>>>
> > >> >>>>>> But now that we understand how that patch broke multiuser I a=
m not
> > >> >>>>>> certain it is also responsible for breaking suspend.
> > >> >>>>>> Satadru, can you try to compile a kernel without this patch a=
nd see if
> > >> >>>>>> it fixes your issue?
> > >> >>>>>>
> > >> >>>>>> On Wed, Mar 16, 2022 at 12:25 PM Steve French <smfrench@gmail=
.com> wrote:
> > >> >>>>>>>
> > >> >>>>>>> Fix shouldn't be hard but agree with Ronnie's points about a=
dding those tests to the buildbot
> > >> >>>>>>>
> > >> >>>>>>> On Tue, Mar 15, 2022, 21:15 ronnie sahlberg <ronniesahlberg@=
gmail.com> wrote:
> > >> >>>>>>>>
> > >> >>>>>>>> I can confirm that patch is what broke multiuser mounts too=
.
> > >> >>>>>>>> Now the question is why the buildbot did not catch this.  I=
 remember
> > >> >>>>>>>> adding a test that basic multiuser worked long time ago.
> > >> >>>>>>>>
> > >> >>>>>>>> I would suggest, once the code is fixed or reverted,
> > >> >>>>>>>> We need someone to look at why the buildbot did not detect =
that
> > >> >>>>>>>> multiuser was broken.
> > >> >>>>>>>> We should also add tests in buildbot for a simple suspend/r=
esume cycle
> > >> >>>>>>>> which should be possible to do using simple virsh commands.
> > >> >>>>>>>>
> > >> >>>>>>>>
> > >> >>>>>>>>
> > >> >>>>>>>> On Wed, Mar 16, 2022 at 8:47 AM Steve French <smfrench@gmai=
l.com> wrote:
> > >> >>>>>>>>>
> > >> >>>>>>>>> We have bisected a regression (may be related) that was re=
producible
> > >> >>>>>>>>> (we had difficulty reproducing Satadru's scenario) and aff=
ects a
> > >> >>>>>>>>> similar area so are focused on that.  We bisected that reg=
ression down
> > >> >>>>>>>>> to this commit added early in 5.17-rc. Adding Ronnie on cc=
 because he
> > >> >>>>>>>>> had noticed the easier to repro scenario. Still debugging.
> > >> >>>>>>>>>
> > >> >>>>>>>>> commit 73f9bfbe3d818bb52266d5c9f3ba57d97842ffe7 (HEAD -> t=
mp)
> > >> >>>>>>>>> Author: Shyam Prasad N <sprasad@microsoft.com>
> > >> >>>>>>>>> Date:   Mon Jul 19 17:37:52 2021 +0000
> > >> >>>>>>>>>
> > >> >>>>>>>>>     cifs: maintain a state machine for tcp/smb/tcon sessio=
ns
> > >> >>>>>>>>>
> > >> >>>>>>>>>     If functions like cifs_negotiate_protocol, cifs_setup_=
session,
> > >> >>>>>>>>>     cifs_tree_connect are called in parallel on different =
channels,
> > >> >>>>>>>>>     each of these will be execute the requests. This maybe=
 unnecessary
> > >> >>>>>>>>>     in some cases, and only the first caller may need to d=
o the work.
> > >> >>>>>>>>>
> > >> >>>>>>>>>     This is achieved by having more states for the tcp/smb=
/tcon session
> > >> >>>>>>>>>     status fields. And tracking the state of reconnection =
based on the
> > >> >>>>>>>>>     state machine.
> > >> >>>>>>>>>
> > >> >>>>>>>>>     For example:
> > >> >>>>>>>>>     for tcp connections:
> > >> >>>>>>>>>     CifsNew/CifsNeedReconnect ->
> > >> >>>>>>>>>       CifsNeedNegotiate ->
> > >> >>>>>>>>>         CifsInNegotiate ->
> > >> >>>>>>>>>           CifsNeedSessSetup ->
> > >> >>>>>>>>>             CifsInSessSetup ->
> > >> >>>>>>>>>               CifsGood
> > >> >>>>>>>>>
> > >> >>>>>>>>>     for smb sessions:
> > >> >>>>>>>>>     CifsNew/CifsNeedReconnect ->
> > >> >>>>>>>>>       CifsGood
> > >> >>>>>>>>>
> > >> >>>>>>>>> On Tue, Mar 15, 2022 at 8:26 AM Thorsten Leemhuis
> > >> >>>>>>>>> <regressions@leemhuis.info> wrote:
> > >> >>>>>>>>>>
> > >> >>>>>>>>>> Hi, this is your Linux kernel regression tracker. Top-pos=
ting for once,
> > >> >>>>>>>>>> to make this easily accessible to everyone.
> > >> >>>>>>>>>>
> > >> >>>>>>>>>> Steve, Shyam, what's up here? Satadru prodided lot's of d=
ata already
> > >> >>>>>>>>>> last week and wrote below message 24h ago, but I haven't =
seen anything
> > >> >>>>>>>>>> about this from your side for more than ten days now. Or =
is the issue
> > >> >>>>>>>>>> (or even a fix?) discussed somewhere else and I just miss=
ed it?
> > >> >>>>>>>>>>
> > >> >>>>>>>>>> Just asking, because thx to rc8 there is still a chance t=
o get this
> > >> >>>>>>>>>> fixed before the final release happens.
> > >> >>>>>>>>>>
> > >> >>>>>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regressio=
n tracker' hat)
> > >> >>>>>>>>>>
> > >> >>>>>>>>>> P.S.: As the Linux kernel's regression tracker I'm gettin=
g a lot of
> > >> >>>>>>>>>> reports on my table. I can only look briefly into most of=
 them and lack
> > >> >>>>>>>>>> knowledge about most of the areas they concern. I thus un=
fortunately
> > >> >>>>>>>>>> will sometimes get things wrong or miss something importa=
nt. I hope
> > >> >>>>>>>>>> that's not the case here; if you think it is, don't hesit=
ate to tell me
> > >> >>>>>>>>>> in a public reply, it's in everyone's interest to set the=
 public record
> > >> >>>>>>>>>> straight.
> > >> >>>>>>>>>>
> > >> >>>>>>>>>> On 14.03.22 14:00, Satadru Pramanik wrote:
> > >> >>>>>>>>>>> This still appears to be an issue in 5.17-rc8.
> > >> >>>>>>>>>>>
> > >> >>>>>>>>>>> I would also not this issue appears when the samba serve=
r reboots. The
> > >> >>>>>>>>>>> client has an unresponsive cifs mount instead of attempt=
ing to retry
> > >> >>>>>>>>>>> the connection.
> > >> >>>>>>>>>>>
> > >> >>>>>>>>>>> dmesg after resume from suspend on 5.17-rc8:
> > >> >>>>>>>>>>>
> > >> >>>>>>>>>>> [ 4072.503603] PM: suspend exit
> > >> >>>>>>>>>>> [ 4076.381594] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: li=
nk becomes ready
> > >> >>>>>>>>>>> [ 4090.501947] CIFS: fs/cifs/inode.c: VFS: in
> > >> >>>>>>>>>>> cifs_revalidate_dentry_attr as Xid: 633 with uid: 0
> > >> >>>>>>>>>>> [ 4090.501966] CIFS: fs/cifs/inode.c: Update attributes:=
 \bin inode
> > >> >>>>>>>>>>> 0x00000000b30e5246 count 1 dentry: 0x0000000080235318 d_=
time
> > >> >>>>>>>>>>> 4295826505 jiffies 4295914933
> > >> >>>>>>>>>>> [ 4090.502012] CIFS: fs/cifs/transport.c: wait_for_free_=
credits:
> > >> >>>>>>>>>>> remove 3 credits total=3D3005
> > >> >>>>>>>>>>> [ 4090.502053] CIFS: fs/cifs/smb2ops.c: Encrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4090.502081] CIFS: fs/cifs/transport.c: Sending smb: s=
mb_len=3D400
> > >> >>>>>>>>>>> [ 4096.800754] CIFS: fs/cifs/cifsfs.c: VFS: in cifs_stat=
fs as Xid: 634
> > >> >>>>>>>>>>> with uid: 1000
> > >> >>>>>>>>>>> [ 4096.800783] CIFS: fs/cifs/transport.c: wait_for_free_=
credits:
> > >> >>>>>>>>>>> remove 3 credits total=3D3002
> > >> >>>>>>>>>>> [ 4096.800822] CIFS: fs/cifs/smb2ops.c: Encrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4096.800845] CIFS: fs/cifs/transport.c: Sending smb: s=
mb_len=3D400
> > >> >>>>>>>>>>> [ 4099.320129] CIFS: fs/cifs/dir.c: VFS: in cifs_lookup =
as Xid: 635
> > >> >>>>>>>>>>> with uid: 1000
> > >> >>>>>>>>>>> [ 4099.320137] CIFS: fs/cifs/dir.c: parent inode =3D 0x0=
0000000cc8fcd81
> > >> >>>>>>>>>>> name is: bashprompt.sh and dentry =3D 0x000000007afa4336
> > >> >>>>>>>>>>> [ 4099.320143] CIFS: fs/cifs/dir.c: NULL inode in lookup
> > >> >>>>>>>>>>> [ 4099.320145] CIFS: fs/cifs/dir.c: Full path: \bashprom=
pt.sh inode =3D
> > >> >>>>>>>>>>> 0x0000000000000000
> > >> >>>>>>>>>>> [ 4099.320164] CIFS: fs/cifs/transport.c: wait_for_free_=
credits:
> > >> >>>>>>>>>>> remove 3 credits total=3D2999
> > >> >>>>>>>>>>> [ 4099.320185] CIFS: fs/cifs/smb2ops.c: Encrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4099.320193] CIFS: fs/cifs/transport.c: Sending smb: s=
mb_len=3D424
> > >> >>>>>>>>>>> [ 4105.135867] CIFS: fs/cifs/smb2pdu.c: In echo request =
for conn_id 4
> > >> >>>>>>>>>>> [ 4105.135891] CIFS: fs/cifs/transport.c: wait_for_free_=
credits:
> > >> >>>>>>>>>>> remove 1 credits total=3D0
> > >> >>>>>>>>>>> [ 4105.135921] CIFS: fs/cifs/transport.c: Sending smb: s=
mb_len=3D72
> > >> >>>>>>>>>>> [ 4166.576112] CIFS: fs/cifs/smb2pdu.c: In echo request =
for conn_id 4
> > >> >>>>>>>>>>> [ 4166.576131] CIFS: fs/cifs/smb2pdu.c: Echo request fai=
led: -11
> > >> >>>>>>>>>>> [ 4166.576138] CIFS: fs/cifs/connect.c: Unable to send e=
cho request to
> > >> >>>>>>>>>>> server: cheekon
> > >> >>>>>>>>>>> [ 4204.895155] CIFS: fs/cifs/inode.c: VFS: in
> > >> >>>>>>>>>>> cifs_revalidate_dentry_attr as Xid: 636 with uid: 1000
> > >> >>>>>>>>>>> [ 4204.895165] CIFS: fs/cifs/inode.c: Update attributes:=
  inode
> > >> >>>>>>>>>>> 0x00000000cc8fcd81 count 2 dentry: 0x000000002b8e3e8b d_=
time 0 jiffies
> > >> >>>>>>>>>>> 4295943531
> > >> >>>>>>>>>>> [ 4204.895186] CIFS: fs/cifs/transport.c: wait_for_free_=
credits:
> > >> >>>>>>>>>>> remove 3 credits total=3D2996
> > >> >>>>>>>>>>> [ 4204.895210] CIFS: fs/cifs/smb2ops.c: Encrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4204.895221] CIFS: fs/cifs/transport.c: Sending smb: s=
mb_len=3D400
> > >> >>>>>>>>>>> [ 4205.757794] CIFS: fs/cifs/transport.c: \\cheekon Canc=
elling wait
> > >> >>>>>>>>>>> for mid 321 cmd: 5
> > >> >>>>>>>>>>> [ 4205.757811] CIFS: fs/cifs/transport.c: \\cheekon Canc=
elling wait
> > >> >>>>>>>>>>> for mid 322 cmd: 16
> > >> >>>>>>>>>>> [ 4205.757816] CIFS: fs/cifs/transport.c: \\cheekon Canc=
elling wait
> > >> >>>>>>>>>>> for mid 323 cmd: 6
> > >> >>>>>>>>>>> [ 4205.757832] CIFS: fs/cifs/inode.c: cifs_get_inode_inf=
o: unhandled err rc -512
> > >> >>>>>>>>>>> [ 4205.757840] CIFS: fs/cifs/inode.c: VFS: leaving
> > >> >>>>>>>>>>> cifs_revalidate_dentry_attr (xid =3D 636) rc =3D -512
> > >> >>>>>>>>>>>
> > >> >>>>>>>>>>>
> > >> >>>>>>>>>>> Also including a manual unmount and remount:
> > >> >>>>>>>>>>>
> > >> >>>>>>>>>>> [ 4205.757840] CIFS: fs/cifs/inode.c: VFS: leaving
> > >> >>>>>>>>>>> cifs_revalidate_dentry_attr (xid =3D 636) rc =3D -512
> > >> >>>>>>>>>>> [ 4220.854276] CIFS: VFS: \\cheekon has not responded in=
 180 seconds.
> > >> >>>>>>>>>>> Reconnecting...
> > >> >>>>>>>>>>> [ 4220.854284] CIFS: fs/cifs/connect.c: Mark tcp session=
 as need reconnect
> > >> >>>>>>>>>>> [ 4220.854287] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> cifs_mark_tcp_ses_conns_for_reconnect: marking necessary=
 sessions and
> > >> >>>>>>>>>>> tcons for reconnect
> > >> >>>>>>>>>>> [ 4220.854289] CIFS: fs/cifs/sess.c: Set reconnect bitma=
sk for chan 0; now 0x1
> > >> >>>>>>>>>>> [ 4220.854292] CIFS: fs/cifs/connect.c: cifs_abort_conne=
ction: tearing
> > >> >>>>>>>>>>> down socket
> > >> >>>>>>>>>>> [ 4220.854293] CIFS: fs/cifs/connect.c: State: 0x3 Flags=
: 0x0
> > >> >>>>>>>>>>> [ 4220.854371] CIFS: fs/cifs/connect.c: Post shutdown st=
ate: 0x3 Flags: 0x0
> > >> >>>>>>>>>>> [ 4220.854378] CIFS: fs/cifs/connect.c: cifs_abort_conne=
ction: moving
> > >> >>>>>>>>>>> mids to private list
> > >> >>>>>>>>>>> [ 4220.854380] CIFS: fs/cifs/connect.c: cifs_abort_conne=
ction: issuing
> > >> >>>>>>>>>>> mid callbacks
> > >> >>>>>>>>>>> [ 4220.854383] cifs_small_buf_release: 1 callbacks suppr=
essed
> > >> >>>>>>>>>>> [ 4220.854384] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4220.854387] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4220.854388] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4220.854397] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4220.854412] CIFS: fs/cifs/dns_resolve.c:
> > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is w=
hole unc:
> > >> >>>>>>>>>>> \\cheekon
> > >> >>>>>>>>>>> [ 4220.854425] CIFS: fs/cifs/transport.c: cifs_sync_mid_=
result: cmd=3D5
> > >> >>>>>>>>>>> mid=3D317 state=3D8
> > >> >>>>>>>>>>> [ 4220.854431] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4220.854431] CIFS: fs/cifs/transport.c: cifs_sync_mid_=
result: cmd=3D5
> > >> >>>>>>>>>>> mid=3D314 state=3D8
> > >> >>>>>>>>>>> [ 4220.854433] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4220.854437] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4220.854439] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4220.854442] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4220.854444] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4220.854451] CIFS: fs/cifs/inode.c: cifs_get_inode_inf=
o: unhandled err rc -11
> > >> >>>>>>>>>>> [ 4220.854450] CIFS: fs/cifs/cifsfs.c: VFS: leaving cifs=
_statfs (xid =3D
> > >> >>>>>>>>>>> 634) rc =3D -11
> > >> >>>>>>>>>>> [ 4220.854451] CIFS: fs/cifs/inode.c: cifs_get_inode_inf=
o: unhandled err rc -11
> > >> >>>>>>>>>>> [ 4220.854463] CIFS: fs/cifs/smb2pdu.c: smb2_reconnect: =
aborting
> > >> >>>>>>>>>>> reconnect due to a received signal by the process
> > >> >>>>>>>>>>> [ 4220.854463] CIFS: fs/cifs/inode.c: cifs_get_inode_inf=
o: unhandled err rc -512
> > >> >>>>>>>>>>> [ 4220.854466] CIFS: fs/cifs/inode.c: cifs_get_inode_inf=
o: unhandled err rc -512
> > >> >>>>>>>>>>> [ 4220.854467] CIFS: fs/cifs/inode.c: VFS: leaving
> > >> >>>>>>>>>>> cifs_revalidate_dentry_attr (xid =3D 633) rc =3D -512
> > >> >>>>>>>>>>> [ 4220.854468] CIFS: fs/cifs/dir.c: Unexpected lookup er=
ror -512
> > >> >>>>>>>>>>> [ 4220.854470] CIFS: fs/cifs/dir.c: cifs_revalidate_dent=
ry failed with rc=3D-512
> > >> >>>>>>>>>>> [ 4220.854470] CIFS: fs/cifs/dir.c: VFS: leaving cifs_lo=
okup (xid =3D
> > >> >>>>>>>>>>> 635) rc =3D -512
> > >> >>>>>>>>>>> [ 4220.854490] CIFS: fs/cifs/dir.c: VFS: in cifs_lookup =
as Xid: 637
> > >> >>>>>>>>>>> with uid: 1000
> > >> >>>>>>>>>>> [ 4220.854493] CIFS: fs/cifs/dir.c: parent inode =3D 0x0=
0000000cc8fcd81
> > >> >>>>>>>>>>> name is: bashprompt.sh and dentry =3D 0x00000000afae7ba3
> > >> >>>>>>>>>>> [ 4220.854498] CIFS: fs/cifs/dir.c: NULL inode in lookup
> > >> >>>>>>>>>>> [ 4220.854499] CIFS: fs/cifs/dir.c: Full path: \bashprom=
pt.sh inode =3D
> > >> >>>>>>>>>>> 0x0000000000000000
> > >> >>>>>>>>>>> [ 4220.854508] CIFS: fs/cifs/smb2pdu.c: smb2_reconnect: =
aborting
> > >> >>>>>>>>>>> reconnect due to a received signal by the process
> > >> >>>>>>>>>>> [ 4220.854511] CIFS: fs/cifs/inode.c: cifs_get_inode_inf=
o: unhandled err rc -512
> > >> >>>>>>>>>>> [ 4220.854513] CIFS: fs/cifs/dir.c: Unexpected lookup er=
ror -512
> > >> >>>>>>>>>>> [ 4220.854514] CIFS: fs/cifs/dir.c: VFS: leaving cifs_lo=
okup (xid =3D
> > >> >>>>>>>>>>> 637) rc =3D -512
> > >> >>>>>>>>>>> [ 4220.854523] CIFS: fs/cifs/dir.c: VFS: in cifs_lookup =
as Xid: 638
> > >> >>>>>>>>>>> with uid: 1000
> > >> >>>>>>>>>>> [ 4220.854529] CIFS: fs/cifs/dir.c: parent inode =3D 0x0=
0000000cc8fcd81
> > >> >>>>>>>>>>> name is: bashprompt.sh and dentry =3D 0x00000000fe692902
> > >> >>>>>>>>>>> [ 4220.854535] CIFS: fs/cifs/dir.c: NULL inode in lookup
> > >> >>>>>>>>>>> [ 4220.854536] CIFS: fs/cifs/dir.c: Full path: \bashprom=
pt.sh inode =3D
> > >> >>>>>>>>>>> 0x0000000000000000
> > >> >>>>>>>>>>> [ 4220.854546] CIFS: fs/cifs/smb2pdu.c: smb2_reconnect: =
aborting
> > >> >>>>>>>>>>> reconnect due to a received signal by the process
> > >> >>>>>>>>>>> [ 4220.854549] CIFS: fs/cifs/inode.c: cifs_get_inode_inf=
o: unhandled err rc -512
> > >> >>>>>>>>>>> [ 4220.854552] CIFS: fs/cifs/dir.c: Unexpected lookup er=
ror -512
> > >> >>>>>>>>>>> [ 4220.854554] CIFS: fs/cifs/dir.c: VFS: leaving cifs_lo=
okup (xid =3D
> > >> >>>>>>>>>>> 638) rc =3D -512
> > >> >>>>>>>>>>> [ 4220.855211] CIFS: fs/cifs/inode.c: VFS: in
> > >> >>>>>>>>>>> cifs_revalidate_dentry_attr as Xid: 639 with uid: 0
> > >> >>>>>>>>>>> [ 4220.855218] CIFS: fs/cifs/inode.c: Update attributes:=
 \bin inode
> > >> >>>>>>>>>>> 0x00000000b30e5246 count 1 dentry: 0x0000000080235318 d_=
time
> > >> >>>>>>>>>>> 4295826505 jiffies 4295947521
> > >> >>>>>>>>>>> [ 4220.856348] CIFS: fs/cifs/cifsfs.c: VFS: in cifs_stat=
fs as Xid: 640
> > >> >>>>>>>>>>> with uid: 1000
> > >> >>>>>>>>>>> [ 4225.844263] CIFS: fs/cifs/dns_resolve.c:
> > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: cheeko=
n
> > >> >>>>>>>>>>> [ 4225.844273] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve serve=
r part of
> > >> >>>>>>>>>>> cheekon to IP: -4
> > >> >>>>>>>>>>> [ 4225.844276] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution sch=
eduled for 600
> > >> >>>>>>>>>>> seconds in the future
> > >> >>>>>>>>>>> [ 4225.844281] CIFS: fs/cifs/connect.c: __cifs_reconnect=
:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> > >> >>>>>>>>>>> [ 4225.844283] CIFS: fs/cifs/connect.c: generic_ip_conne=
ct: connecting
> > >> >>>>>>>>>>> to 192.168.0.20:445
> > >> >>>>>>>>>>> [ 4225.844293] CIFS: fs/cifs/connect.c: Socket created
> > >> >>>>>>>>>>> [ 4225.844295] CIFS: fs/cifs/connect.c: sndbuf 16384 rcv=
buf 131072
> > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > >> >>>>>>>>>>> [ 4228.912632] CIFS: fs/cifs/connect.c: Error -113 conne=
cting to server
> > >> >>>>>>>>>>> [ 4228.912670] CIFS: fs/cifs/connect.c: __cifs_reconnect=
: reconnect error -113
> > >> >>>>>>>>>>> [ 4231.088378] CIFS: fs/cifs/smb2pdu.c: gave up waiting =
on reconnect in smb_init
> > >> >>>>>>>>>>> [ 4231.088383] CIFS: fs/cifs/smb2pdu.c: gave up waiting =
on reconnect in smb_init
> > >> >>>>>>>>>>> [ 4231.088385] cifs_small_buf_release: 7 callbacks suppr=
essed
> > >> >>>>>>>>>>> [ 4231.088387] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4231.088388] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4231.088390] CIFS: fs/cifs/cifsfs.c: VFS: leaving cifs=
_statfs (xid =3D
> > >> >>>>>>>>>>> 640) rc =3D -112
> > >> >>>>>>>>>>> [ 4231.088393] CIFS: fs/cifs/inode.c: cifs_get_inode_inf=
o: unhandled err rc -112
> > >> >>>>>>>>>>> [ 4231.088398] CIFS: fs/cifs/inode.c: VFS: leaving
> > >> >>>>>>>>>>> cifs_revalidate_dentry_attr (xid =3D 639) rc =3D -112
> > >> >>>>>>>>>>> [ 4231.088401] CIFS: fs/cifs/dir.c: cifs_revalidate_dent=
ry failed with rc=3D-112
> > >> >>>>>>>>>>> [ 4231.088421] CIFS: fs/cifs/inode.c: VFS: in
> > >> >>>>>>>>>>> cifs_revalidate_dentry_attr as Xid: 641 with uid: 0
> > >> >>>>>>>>>>> [ 4231.088425] CIFS: fs/cifs/inode.c: Update attributes:=
 \x86_64 inode
> > >> >>>>>>>>>>> 0x000000004022c915 count 1 dentry: 0x00000000669397cc d_=
time
> > >> >>>>>>>>>>> 4295826508 jiffies 4295950080
> > >> >>>>>>>>>>> [ 4232.112342] CIFS: fs/cifs/dns_resolve.c:
> > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is w=
hole unc:
> > >> >>>>>>>>>>> \\cheekon
> > >> >>>>>>>>>>> [ 4238.141384] CIFS: fs/cifs/dns_resolve.c:
> > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: cheeko=
n
> > >> >>>>>>>>>>> [ 4238.141400] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve serve=
r part of
> > >> >>>>>>>>>>> cheekon to IP: -4
> > >> >>>>>>>>>>> [ 4238.141408] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution sch=
eduled for 600
> > >> >>>>>>>>>>> seconds in the future
> > >> >>>>>>>>>>> [ 4238.141417] CIFS: fs/cifs/connect.c: __cifs_reconnect=
:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> > >> >>>>>>>>>>> [ 4238.141422] CIFS: fs/cifs/connect.c: generic_ip_conne=
ct: connecting
> > >> >>>>>>>>>>> to 192.168.0.20:445
> > >> >>>>>>>>>>> [ 4238.141441] CIFS: fs/cifs/connect.c: Socket created
> > >> >>>>>>>>>>> [ 4238.141445] CIFS: fs/cifs/connect.c: sndbuf 16384 rcv=
buf 131072
> > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > >> >>>>>>>>>>> [ 4241.200798] CIFS: fs/cifs/connect.c: Error -113 conne=
cting to server
> > >> >>>>>>>>>>> [ 4241.200826] CIFS: fs/cifs/connect.c: __cifs_reconnect=
: reconnect error -113
> > >> >>>>>>>>>>> [ 4241.328397] CIFS: fs/cifs/smb2pdu.c: gave up waiting =
on reconnect in smb_init
> > >> >>>>>>>>>>> [ 4241.328409] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4241.328417] CIFS: fs/cifs/inode.c: cifs_get_inode_inf=
o: unhandled err rc -112
> > >> >>>>>>>>>>> [ 4241.328423] CIFS: fs/cifs/inode.c: VFS: leaving
> > >> >>>>>>>>>>> cifs_revalidate_dentry_attr (xid =3D 641) rc =3D -112
> > >> >>>>>>>>>>> [ 4241.328426] CIFS: fs/cifs/dir.c: cifs_revalidate_dent=
ry failed with rc=3D-112
> > >> >>>>>>>>>>> [ 4244.400422] CIFS: fs/cifs/dns_resolve.c:
> > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is w=
hole unc:
> > >> >>>>>>>>>>> \\cheekon
> > >> >>>>>>>>>>> [ 4250.434011] CIFS: fs/cifs/dns_resolve.c:
> > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: cheeko=
n
> > >> >>>>>>>>>>> [ 4250.434033] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve serve=
r part of
> > >> >>>>>>>>>>> cheekon to IP: -4
> > >> >>>>>>>>>>> [ 4250.434043] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution sch=
eduled for 600
> > >> >>>>>>>>>>> seconds in the future
> > >> >>>>>>>>>>> [ 4250.434056] CIFS: fs/cifs/connect.c: __cifs_reconnect=
:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> > >> >>>>>>>>>>> [ 4250.434063] CIFS: fs/cifs/connect.c: generic_ip_conne=
ct: connecting
> > >> >>>>>>>>>>> to 192.168.0.20:445
> > >> >>>>>>>>>>> [ 4250.434086] CIFS: fs/cifs/connect.c: Socket created
> > >> >>>>>>>>>>> [ 4250.434091] CIFS: fs/cifs/connect.c: sndbuf 16384 rcv=
buf 131072
> > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > >> >>>>>>>>>>> [ 4253.488848] CIFS: fs/cifs/connect.c: Error -113 conne=
cting to server
> > >> >>>>>>>>>>> [ 4253.488875] CIFS: fs/cifs/connect.c: __cifs_reconnect=
: reconnect error -113
> > >> >>>>>>>>>>> [ 4256.688419] CIFS: fs/cifs/dns_resolve.c:
> > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is w=
hole unc:
> > >> >>>>>>>>>>> \\cheekon
> > >> >>>>>>>>>>> [ 4265.790981] CIFS: fs/cifs/dns_resolve.c:
> > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: cheeko=
n
> > >> >>>>>>>>>>> [ 4265.790995] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve serve=
r part of
> > >> >>>>>>>>>>> cheekon to IP: -4
> > >> >>>>>>>>>>> [ 4265.791000] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution sch=
eduled for 600
> > >> >>>>>>>>>>> seconds in the future
> > >> >>>>>>>>>>> [ 4265.791005] CIFS: fs/cifs/connect.c: __cifs_reconnect=
:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> > >> >>>>>>>>>>> [ 4265.791008] CIFS: fs/cifs/connect.c: generic_ip_conne=
ct: connecting
> > >> >>>>>>>>>>> to 192.168.0.20:445
> > >> >>>>>>>>>>> [ 4265.791022] CIFS: fs/cifs/connect.c: Socket created
> > >> >>>>>>>>>>> [ 4265.791025] CIFS: fs/cifs/connect.c: sndbuf 16384 rcv=
buf 131072
> > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > >> >>>>>>>>>>> [ 4268.848709] CIFS: fs/cifs/connect.c: Error -113 conne=
cting to server
> > >> >>>>>>>>>>> [ 4268.848752] CIFS: fs/cifs/connect.c: __cifs_reconnect=
: reconnect error -113
> > >> >>>>>>>>>>> [ 4272.052440] CIFS: fs/cifs/dns_resolve.c:
> > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is w=
hole unc:
> > >> >>>>>>>>>>> \\cheekon
> > >> >>>>>>>>>>> [ 4278.078864] CIFS: fs/cifs/dns_resolve.c:
> > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: cheeko=
n
> > >> >>>>>>>>>>> [ 4278.078889] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve serve=
r part of
> > >> >>>>>>>>>>> cheekon to IP: -4
> > >> >>>>>>>>>>> [ 4278.078898] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution sch=
eduled for 600
> > >> >>>>>>>>>>> seconds in the future
> > >> >>>>>>>>>>> [ 4278.078904] CIFS: fs/cifs/connect.c: __cifs_reconnect=
:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> > >> >>>>>>>>>>> [ 4278.078911] CIFS: fs/cifs/connect.c: generic_ip_conne=
ct: connecting
> > >> >>>>>>>>>>> to 192.168.0.20:445
> > >> >>>>>>>>>>> [ 4278.078937] CIFS: fs/cifs/connect.c: Socket created
> > >> >>>>>>>>>>> [ 4278.078942] CIFS: fs/cifs/connect.c: sndbuf 16384 rcv=
buf 131072
> > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > >> >>>>>>>>>>> [ 4280.826140] CIFS: fs/cifs/cifsfs.c: VFS: in cifs_stat=
fs as Xid: 642
> > >> >>>>>>>>>>> with uid: 1000
> > >> >>>>>>>>>>> [ 4281.136704] CIFS: fs/cifs/connect.c: Error -113 conne=
cting to server
> > >> >>>>>>>>>>> [ 4281.136737] CIFS: fs/cifs/connect.c: __cifs_reconnect=
: reconnect error -113
> > >> >>>>>>>>>>> [ 4284.336534] CIFS: fs/cifs/dns_resolve.c:
> > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is w=
hole unc:
> > >> >>>>>>>>>>> \\cheekon
> > >> >>>>>>>>>>> [ 4290.992510] CIFS: fs/cifs/smb2pdu.c: gave up waiting =
on reconnect in smb_init
> > >> >>>>>>>>>>> [ 4290.992532] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4290.992543] CIFS: fs/cifs/cifsfs.c: VFS: leaving cifs=
_statfs (xid =3D
> > >> >>>>>>>>>>> 642) rc =3D -112
> > >> >>>>>>>>>>> [ 4292.289757] CIFS: fs/cifs/dns_resolve.c:
> > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: cheeko=
n
> > >> >>>>>>>>>>> [ 4292.289765] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve serve=
r part of
> > >> >>>>>>>>>>> cheekon to IP: -4
> > >> >>>>>>>>>>> [ 4292.289769] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution sch=
eduled for 600
> > >> >>>>>>>>>>> seconds in the future
> > >> >>>>>>>>>>> [ 4292.289773] CIFS: fs/cifs/connect.c: __cifs_reconnect=
:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> > >> >>>>>>>>>>> [ 4292.289776] CIFS: fs/cifs/connect.c: generic_ip_conne=
ct: connecting
> > >> >>>>>>>>>>> to 192.168.0.20:445
> > >> >>>>>>>>>>> [ 4292.289793] CIFS: fs/cifs/connect.c: Socket created
> > >> >>>>>>>>>>> [ 4292.289794] CIFS: fs/cifs/connect.c: sndbuf 16384 rcv=
buf 131072
> > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > >> >>>>>>>>>>> [ 4295.348741] CIFS: fs/cifs/connect.c: Error -113 conne=
cting to server
> > >> >>>>>>>>>>> [ 4295.348773] CIFS: fs/cifs/connect.c: __cifs_reconnect=
: reconnect error -113
> > >> >>>>>>>>>>> [ 4298.416556] CIFS: fs/cifs/dns_resolve.c:
> > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is w=
hole unc:
> > >> >>>>>>>>>>> \\cheekon
> > >> >>>>>>>>>>> [ 4308.425564] CIFS: fs/cifs/dns_resolve.c:
> > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: cheeko=
n
> > >> >>>>>>>>>>> [ 4308.425582] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve serve=
r part of
> > >> >>>>>>>>>>> cheekon to IP: -4
> > >> >>>>>>>>>>> [ 4308.425589] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution sch=
eduled for 600
> > >> >>>>>>>>>>> seconds in the future
> > >> >>>>>>>>>>> [ 4308.425595] CIFS: fs/cifs/connect.c: __cifs_reconnect=
:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> > >> >>>>>>>>>>> [ 4308.425599] CIFS: fs/cifs/connect.c: generic_ip_conne=
ct: connecting
> > >> >>>>>>>>>>> to 192.168.0.20:445
> > >> >>>>>>>>>>> [ 4308.425621] CIFS: fs/cifs/connect.c: Socket created
> > >> >>>>>>>>>>> [ 4308.425625] CIFS: fs/cifs/connect.c: sndbuf 16384 rcv=
buf 131072
> > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > >> >>>>>>>>>>> [ 4311.505060] CIFS: fs/cifs/connect.c: Error -113 conne=
cting to server
> > >> >>>>>>>>>>> [ 4311.505094] CIFS: fs/cifs/connect.c: __cifs_reconnect=
: reconnect error -113
> > >> >>>>>>>>>>> [ 4314.544551] CIFS: fs/cifs/dns_resolve.c:
> > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is w=
hole unc:
> > >> >>>>>>>>>>> \\cheekon
> > >> >>>>>>>>>>> [ 4323.328365] CIFS: fs/cifs/dns_resolve.c:
> > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: cheeko=
n
> > >> >>>>>>>>>>> [ 4323.328387] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve serve=
r part of
> > >> >>>>>>>>>>> cheekon to IP: -4
> > >> >>>>>>>>>>> [ 4323.328397] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution sch=
eduled for 600
> > >> >>>>>>>>>>> seconds in the future
> > >> >>>>>>>>>>> [ 4323.328406] CIFS: fs/cifs/connect.c: __cifs_reconnect=
:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> > >> >>>>>>>>>>> [ 4323.328413] CIFS: fs/cifs/connect.c: generic_ip_conne=
ct: connecting
> > >> >>>>>>>>>>> to 192.168.0.20:445
> > >> >>>>>>>>>>> [ 4323.328437] CIFS: fs/cifs/connect.c: Socket created
> > >> >>>>>>>>>>> [ 4323.328441] CIFS: fs/cifs/connect.c: sndbuf 16384 rcv=
buf 131072
> > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > >> >>>>>>>>>>> [ 4326.384727] CIFS: fs/cifs/connect.c: Error -113 conne=
cting to server
> > >> >>>>>>>>>>> [ 4326.384755] CIFS: fs/cifs/connect.c: __cifs_reconnect=
: reconnect error -113
> > >> >>>>>>>>>>> [ 4329.392599] CIFS: fs/cifs/dns_resolve.c:
> > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is w=
hole unc:
> > >> >>>>>>>>>>> \\cheekon
> > >> >>>>>>>>>>> [ 4339.406543] CIFS: fs/cifs/dns_resolve.c:
> > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: cheeko=
n
> > >> >>>>>>>>>>> [ 4339.406550] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve serve=
r part of
> > >> >>>>>>>>>>> cheekon to IP: -4
> > >> >>>>>>>>>>> [ 4339.406553] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution sch=
eduled for 600
> > >> >>>>>>>>>>> seconds in the future
> > >> >>>>>>>>>>> [ 4339.406556] CIFS: fs/cifs/connect.c: __cifs_reconnect=
:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> > >> >>>>>>>>>>> [ 4339.406559] CIFS: fs/cifs/connect.c: generic_ip_conne=
ct: connecting
> > >> >>>>>>>>>>> to 192.168.0.20:445
> > >> >>>>>>>>>>> [ 4339.406567] CIFS: fs/cifs/connect.c: Socket created
> > >> >>>>>>>>>>> [ 4339.406568] CIFS: fs/cifs/connect.c: sndbuf 16384 rcv=
buf 131072
> > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > >> >>>>>>>>>>> [ 4340.826465] CIFS: fs/cifs/cifsfs.c: VFS: in cifs_stat=
fs as Xid: 643
> > >> >>>>>>>>>>> with uid: 1000
> > >> >>>>>>>>>>> [ 4342.481043] CIFS: fs/cifs/connect.c: Error -113 conne=
cting to server
> > >> >>>>>>>>>>> [ 4342.481071] CIFS: fs/cifs/connect.c: __cifs_reconnect=
: reconnect error -113
> > >> >>>>>>>>>>> [ 4343.513393] CIFS: fs/cifs/inode.c: VFS: in
> > >> >>>>>>>>>>> cifs_revalidate_dentry_attr as Xid: 644 with uid: 0
> > >> >>>>>>>>>>> [ 4343.513400] CIFS: fs/cifs/inode.c: Update attributes:=
  inode
> > >> >>>>>>>>>>> 0x00000000cc8fcd81 count 2 dentry: 0x000000002b8e3e8b d_=
time 0 jiffies
> > >> >>>>>>>>>>> 4295978186
> > >> >>>>>>>>>>> [ 4345.520578] CIFS: fs/cifs/dns_resolve.c:
> > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: probably server name is w=
hole unc:
> > >> >>>>>>>>>>> \\cheekon
> > >> >>>>>>>>>>> [ 4350.900608] CIFS: fs/cifs/smb2pdu.c: gave up waiting =
on reconnect in smb_init
> > >> >>>>>>>>>>> [ 4350.900628] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4350.900632] CIFS: fs/cifs/cifsfs.c: VFS: leaving cifs=
_statfs (xid =3D
> > >> >>>>>>>>>>> 643) rc =3D -112
> > >> >>>>>>>>>>> [ 4353.712700] CIFS: fs/cifs/smb2pdu.c: gave up waiting =
on reconnect in smb_init
> > >> >>>>>>>>>>> [ 4353.712720] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4353.712728] CIFS: fs/cifs/inode.c: cifs_get_inode_inf=
o: unhandled err rc -112
> > >> >>>>>>>>>>> [ 4353.712734] CIFS: fs/cifs/inode.c: VFS: leaving
> > >> >>>>>>>>>>> cifs_revalidate_dentry_attr (xid =3D 644) rc =3D -112
> > >> >>>>>>>>>>> [ 4353.714004] CIFS: fs/cifs/connect.c: cifs_put_tcon: t=
c_count=3D1
> > >> >>>>>>>>>>> [ 4353.714015] CIFS: fs/cifs/connect.c: VFS: in cifs_put=
_tcon as Xid:
> > >> >>>>>>>>>>> 645 with uid: 0
> > >> >>>>>>>>>>> [ 4353.714020] CIFS: fs/cifs/smb2pdu.c: Tree Disconnect
> > >> >>>>>>>>>>> [ 4353.714024] CIFS: fs/cifs/fscache.c:
> > >> >>>>>>>>>>> cifs_fscache_release_super_cookie: (0x0000000000000000)
> > >> >>>>>>>>>>> [ 4353.714032] CIFS: fs/cifs/connect.c: cifs_put_smb_ses=
: ses_count=3D1
> > >> >>>>>>>>>>> [ 4353.714037] CIFS: fs/cifs/connect.c: cifs_put_smb_ses=
: ses_count=3D1
> > >> >>>>>>>>>>> [ 4353.714039] CIFS: fs/cifs/connect.c: cifs_put_smb_ses=
: ses ipc:
> > >> >>>>>>>>>>> \\cheekon\IPC$
> > >> >>>>>>>>>>> [ 4355.529971] CIFS: fs/cifs/dns_resolve.c:
> > >> >>>>>>>>>>> dns_resolve_server_name_to_ip: unable to resolve: cheeko=
n
> > >> >>>>>>>>>>> [ 4355.529988] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: failed to resolve serve=
r part of
> > >> >>>>>>>>>>> \x1b\x86\xb9\xeaj1\x15\xb2;\x87\xb9\xeaj1\x15\x8a@\x04 t=
o IP: -4
> > >> >>>>>>>>>>> [ 4355.529996] CIFS: fs/cifs/connect.c:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: next dns resolution sch=
eduled for 600
> > >> >>>>>>>>>>> seconds in the future
> > >> >>>>>>>>>>> [ 4355.530002] CIFS: fs/cifs/connect.c: __cifs_reconnect=
:
> > >> >>>>>>>>>>> reconn_set_ipaddr_from_hostname: rc=3D-4
> > >> >>>>>>>>>>> [ 4355.530006] CIFS: fs/cifs/connect.c: generic_ip_conne=
ct: connecting
> > >> >>>>>>>>>>> to 192.168.0.20:445
> > >> >>>>>>>>>>> [ 4355.530025] CIFS: fs/cifs/connect.c: Socket created
> > >> >>>>>>>>>>> [ 4355.530027] CIFS: fs/cifs/connect.c: sndbuf 16384 rcv=
buf 131072
> > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > >> >>>>>>>>>>> [ 4355.530185] CIFS: fs/cifs/connect.c: Error -4 connect=
ing to server
> > >> >>>>>>>>>>> [ 4355.530201] CIFS: fs/cifs/connect.c: __cifs_reconnect=
: reconnect error -4
> > >> >>>>>>>>>>> [ 4372.001470] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: li=
nk becomes ready
> > >> >>>>>>>>>>> [ 4377.427015] smb3_fs_context_parse_param: 1 callbacks =
suppressed
> > >> >>>>>>>>>>> [ 4377.427018] CIFS: fs/cifs/fs_context.c: CIFS: parsing=
 cifs mount
> > >> >>>>>>>>>>> option 'source'
> > >> >>>>>>>>>>> [ 4377.427025] CIFS: fs/cifs/fs_context.c: CIFS: parsing=
 cifs mount option 'ip'
> > >> >>>>>>>>>>> [ 4377.427028] CIFS: fs/cifs/fs_context.c: CIFS: parsing=
 cifs mount option 'unc'
> > >> >>>>>>>>>>> [ 4377.427030] CIFS: fs/cifs/fs_context.c: CIFS: parsing=
 cifs mount
> > >> >>>>>>>>>>> option 'forceuid'
> > >> >>>>>>>>>>> [ 4377.427032] CIFS: fs/cifs/fs_context.c: CIFS: parsing=
 cifs mount
> > >> >>>>>>>>>>> option 'resilienthandles'
> > >> >>>>>>>>>>> [ 4377.427033] CIFS: fs/cifs/fs_context.c: CIFS: parsing=
 cifs mount
> > >> >>>>>>>>>>> option 'vers'
> > >> >>>>>>>>>>> [ 4377.427036] CIFS: fs/cifs/fs_context.c: CIFS: parsing=
 cifs mount
> > >> >>>>>>>>>>> option 'iocharset'
> > >> >>>>>>>>>>> [ 4377.427038] CIFS: fs/cifs/fs_context.c: iocharset set=
 to utf8
> > >> >>>>>>>>>>> [ 4377.427039] CIFS: fs/cifs/fs_context.c: CIFS: parsing=
 cifs mount
> > >> >>>>>>>>>>> option 'cifsacl'
> > >> >>>>>>>>>>> [ 4377.427040] CIFS: fs/cifs/fs_context.c: CIFS: parsing=
 cifs mount option 'uid'
> > >> >>>>>>>>>>> [ 4377.427043] CIFS: fs/cifs/fs_context.c: CIFS: parsing=
 cifs mount
> > >> >>>>>>>>>>> option 'user'
> > >> >>>>>>>>>>> [ 4377.427047] CIFS: fs/cifs/cifsfs.c: Devname: \\cheeko=
n\localnet flags: 0
> > >> >>>>>>>>>>> [ 4377.427050] CIFS: fs/cifs/connect.c: Username: localn=
et
> > >> >>>>>>>>>>> [ 4377.427052] CIFS: fs/cifs/connect.c: file mode: 0755 =
 dir mode: 0755
> > >> >>>>>>>>>>> [ 4377.427055] CIFS: fs/cifs/connect.c: VFS: in mount_ge=
t_conns as
> > >> >>>>>>>>>>> Xid: 646 with uid: 0
> > >> >>>>>>>>>>> [ 4377.427057] CIFS: fs/cifs/connect.c: UNC: \\cheekon\l=
ocalnet
> > >> >>>>>>>>>>> [ 4377.427060] CIFS: fs/cifs/connect.c: generic_ip_conne=
ct: connecting
> > >> >>>>>>>>>>> to 192.168.0.20:445
> > >> >>>>>>>>>>> [ 4377.427067] CIFS: fs/cifs/connect.c: Socket created
> > >> >>>>>>>>>>> [ 4377.427069] CIFS: fs/cifs/connect.c: sndbuf 16384 rcv=
buf 131072
> > >> >>>>>>>>>>> rcvtimeo 0x6d6
> > >> >>>>>>>>>>> [ 4377.428082] CIFS: fs/cifs/connect.c: cifs_get_tcp_ses=
sion: next dns
> > >> >>>>>>>>>>> resolution scheduled for 600 seconds in the future
> > >> >>>>>>>>>>> [ 4377.428086] CIFS: fs/cifs/connect.c: VFS: in cifs_get=
_smb_ses as
> > >> >>>>>>>>>>> Xid: 647 with uid: 0
> > >> >>>>>>>>>>> [ 4377.428089] CIFS: fs/cifs/connect.c: Existing smb ses=
s not found
> > >> >>>>>>>>>>> [ 4377.428093] CIFS: fs/cifs/smb2pdu.c: Negotiate protoc=
ol
> > >> >>>>>>>>>>> [ 4377.428093] CIFS: fs/cifs/connect.c: Demultiplex PID:=
 77240
> > >> >>>>>>>>>>> [ 4377.428098] CIFS: fs/cifs/transport.c: wait_for_free_=
credits:
> > >> >>>>>>>>>>> remove 1 credits total=3D0
> > >> >>>>>>>>>>> [ 4377.428113] CIFS: fs/cifs/transport.c: Sending smb: s=
mb_len=3D220
> > >> >>>>>>>>>>> [ 4377.432265] CIFS: fs/cifs/connect.c: RFC1002 header 0=
x10c
> > >> >>>>>>>>>>> [ 4377.432272] CIFS: fs/cifs/smb2misc.c: SMB2 data lengt=
h 74 offset 128
> > >> >>>>>>>>>>> [ 4377.432274] CIFS: fs/cifs/smb2misc.c: SMB2 len 202
> > >> >>>>>>>>>>> [ 4377.432276] CIFS: fs/cifs/smb2misc.c: length of negco=
ntexts 60 pad 6
> > >> >>>>>>>>>>> [ 4377.432279] CIFS: fs/cifs/smb2ops.c: smb2_add_credits=
: added 1
> > >> >>>>>>>>>>> credits total=3D1
> > >> >>>>>>>>>>> [ 4377.432305] CIFS: fs/cifs/transport.c: cifs_sync_mid_=
result: cmd=3D0
> > >> >>>>>>>>>>> mid=3D0 state=3D4
> > >> >>>>>>>>>>> [ 4377.432314] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4377.432317] CIFS: fs/cifs/smb2pdu.c: mode 0x1
> > >> >>>>>>>>>>> [ 4377.432319] CIFS: fs/cifs/smb2pdu.c: negotiated smb3.=
1.1 dialect
> > >> >>>>>>>>>>> [ 4377.432322] CIFS: fs/cifs/smb2pdu.c: decoding 2 negot=
iate contexts
> > >> >>>>>>>>>>> [ 4377.432324] CIFS: fs/cifs/smb2pdu.c: decode SMB3.11 e=
ncryption neg
> > >> >>>>>>>>>>> context of len 4
> > >> >>>>>>>>>>> [ 4377.432326] CIFS: fs/cifs/smb2pdu.c: SMB311 cipher ty=
pe:2
> > >> >>>>>>>>>>> [ 4377.432328] CIFS: fs/cifs/connect.c: Security Mode: 0=
x1
> > >> >>>>>>>>>>> Capabilities: 0x300046 TimeAdjust: 0
> > >> >>>>>>>>>>> [ 4377.432332] CIFS: fs/cifs/smb2pdu.c: Session Setup
> > >> >>>>>>>>>>> [ 4377.432333] CIFS: fs/cifs/smb2pdu.c: sess setup type =
2
> > >> >>>>>>>>>>> [ 4377.432336] CIFS: fs/cifs/smb2pdu.c: Fresh session. P=
revious: 0
> > >> >>>>>>>>>>> [ 4377.432338] CIFS: fs/cifs/transport.c: wait_for_free_=
credits:
> > >> >>>>>>>>>>> remove 1 credits total=3D0
> > >> >>>>>>>>>>> [ 4377.432346] CIFS: fs/cifs/transport.c: Sending smb: s=
mb_len=3D136
> > >> >>>>>>>>>>> [ 4377.433477] CIFS: fs/cifs/connect.c: RFC1002 header 0=
xda
> > >> >>>>>>>>>>> [ 4377.433483] CIFS: fs/cifs/smb2misc.c: SMB2 data lengt=
h 146 offset 72
> > >> >>>>>>>>>>> [ 4377.433485] CIFS: fs/cifs/smb2misc.c: SMB2 len 218
> > >> >>>>>>>>>>> [ 4377.433488] CIFS: fs/cifs/smb2ops.c: smb2_add_credits=
: added 1
> > >> >>>>>>>>>>> credits total=3D1
> > >> >>>>>>>>>>> [ 4377.433512] CIFS: fs/cifs/transport.c: cifs_sync_mid_=
result: cmd=3D1
> > >> >>>>>>>>>>> mid=3D1 state=3D4
> > >> >>>>>>>>>>> [ 4377.433518] CIFS: Status code returned 0xc0000016
> > >> >>>>>>>>>>> STATUS_MORE_PROCESSING_REQUIRED
> > >> >>>>>>>>>>> [ 4377.433526] CIFS: fs/cifs/smb2maperror.c: Mapping SMB=
2 status code
> > >> >>>>>>>>>>> 0xc0000016 to POSIX err -5
> > >> >>>>>>>>>>> [ 4377.433531] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4377.433534] CIFS: fs/cifs/sess.c: decode_ntlmssp_chal=
lenge:
> > >> >>>>>>>>>>> negotiate=3D0xe2088235 challenge=3D0xe28a8235
> > >> >>>>>>>>>>> [ 4377.433536] CIFS: fs/cifs/smb2pdu.c: rawntlmssp sessi=
on setup challenge phase
> > >> >>>>>>>>>>> [ 4377.433539] CIFS: fs/cifs/smb2pdu.c: Fresh session. P=
revious: 0
> > >> >>>>>>>>>>> [ 4377.433558] CIFS: fs/cifs/transport.c: wait_for_free_=
credits:
> > >> >>>>>>>>>>> remove 1 credits total=3D0
> > >> >>>>>>>>>>> [ 4377.433565] CIFS: fs/cifs/transport.c: Sending smb: s=
mb_len=3D320
> > >> >>>>>>>>>>> [ 4377.446423] CIFS: fs/cifs/connect.c: RFC1002 header 0=
x48
> > >> >>>>>>>>>>> [ 4377.446436] CIFS: fs/cifs/smb2misc.c: SMB2 data lengt=
h 0 offset 72
> > >> >>>>>>>>>>> [ 4377.446440] CIFS: fs/cifs/smb2misc.c: SMB2 len 73
> > >> >>>>>>>>>>> [ 4377.446442] CIFS: fs/cifs/smb2misc.c: Calculated size=
 73 length 72
> > >> >>>>>>>>>>> mismatch mid 2
> > >> >>>>>>>>>>> [ 4377.446446] CIFS: fs/cifs/smb2ops.c: smb2_add_credits=
: added 130
> > >> >>>>>>>>>>> credits total=3D130
> > >> >>>>>>>>>>> [ 4377.446478] CIFS: fs/cifs/transport.c: cifs_sync_mid_=
result: cmd=3D1
> > >> >>>>>>>>>>> mid=3D2 state=3D4
> > >> >>>>>>>>>>> [ 4377.446484] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4377.446499] CIFS: fs/cifs/smb2pdu.c: SMB2/3 session e=
stablished successfully
> > >> >>>>>>>>>>> [ 4377.446502] CIFS: fs/cifs/sess.c: Cleared reconnect b=
itmask for
> > >> >>>>>>>>>>> chan 0; now 0x0
> > >> >>>>>>>>>>> [ 4377.446505] CIFS: fs/cifs/connect.c: VFS: leaving cif=
s_get_smb_ses
> > >> >>>>>>>>>>> (xid =3D 647) rc =3D 0
> > >> >>>>>>>>>>> [ 4377.446508] CIFS: fs/cifs/connect.c: VFS: in cifs_set=
up_ipc as Xid:
> > >> >>>>>>>>>>> 648 with uid: 0
> > >> >>>>>>>>>>> [ 4377.446510] CIFS: fs/cifs/smb2pdu.c: TCON
> > >> >>>>>>>>>>> [ 4377.446513] CIFS: fs/cifs/transport.c: wait_for_free_=
credits:
> > >> >>>>>>>>>>> remove 1 credits total=3D129
> > >> >>>>>>>>>>> [ 4377.446539] CIFS: fs/cifs/smb2ops.c: Encrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4377.446548] CIFS: fs/cifs/transport.c: Sending smb: s=
mb_len=3D158
> > >> >>>>>>>>>>> [ 4377.455288] CIFS: fs/cifs/connect.c: RFC1002 header 0=
x84
> > >> >>>>>>>>>>> [ 4377.455308] CIFS: fs/cifs/smb2ops.c: Decrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4377.455310] CIFS: fs/cifs/smb2ops.c: mid found
> > >> >>>>>>>>>>> [ 4377.455312] CIFS: fs/cifs/smb2misc.c: SMB2 len 80
> > >> >>>>>>>>>>> [ 4377.455315] CIFS: fs/cifs/smb2ops.c: smb2_add_credits=
: added 64
> > >> >>>>>>>>>>> credits total=3D191
> > >> >>>>>>>>>>> [ 4377.455344] CIFS: fs/cifs/transport.c: cifs_sync_mid_=
result: cmd=3D3
> > >> >>>>>>>>>>> mid=3D3 state=3D4
> > >> >>>>>>>>>>> [ 4377.455349] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4377.455352] CIFS: fs/cifs/smb2pdu.c: connection to pi=
pe share
> > >> >>>>>>>>>>> [ 4377.455355] CIFS: fs/cifs/connect.c: VFS: leaving cif=
s_setup_ipc
> > >> >>>>>>>>>>> (xid =3D 648) rc =3D 0
> > >> >>>>>>>>>>> [ 4377.455357] CIFS: fs/cifs/connect.c: IPC tcon rc =3D =
0 ipc tid =3D -1798775872
> > >> >>>>>>>>>>> [ 4377.455362] CIFS: fs/cifs/connect.c: VFS: in cifs_get=
_tcon as Xid:
> > >> >>>>>>>>>>> 649 with uid: 0
> > >> >>>>>>>>>>> [ 4377.455364] CIFS: fs/cifs/smb2pdu.c: TCON
> > >> >>>>>>>>>>> [ 4377.455367] CIFS: fs/cifs/transport.c: wait_for_free_=
credits:
> > >> >>>>>>>>>>> remove 1 credits total=3D190
> > >> >>>>>>>>>>> [ 4377.455376] CIFS: fs/cifs/smb2ops.c: Encrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4377.455384] CIFS: fs/cifs/transport.c: Sending smb: s=
mb_len=3D166
> > >> >>>>>>>>>>> [ 4377.457328] CIFS: fs/cifs/connect.c: RFC1002 header 0=
x84
> > >> >>>>>>>>>>> [ 4377.457341] CIFS: fs/cifs/smb2ops.c: Decrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4377.457343] CIFS: fs/cifs/smb2ops.c: mid found
> > >> >>>>>>>>>>> [ 4377.457345] CIFS: fs/cifs/smb2misc.c: SMB2 len 80
> > >> >>>>>>>>>>> [ 4377.457347] CIFS: fs/cifs/smb2ops.c: smb2_add_credits=
: added 64
> > >> >>>>>>>>>>> credits total=3D254
> > >> >>>>>>>>>>> [ 4377.457373] CIFS: fs/cifs/transport.c: cifs_sync_mid_=
result: cmd=3D3
> > >> >>>>>>>>>>> mid=3D4 state=3D4
> > >> >>>>>>>>>>> [ 4377.457378] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4377.457380] CIFS: fs/cifs/smb2pdu.c: connection to di=
sk share
> > >> >>>>>>>>>>> [ 4377.457383] CIFS: fs/cifs/connect.c: VFS: leaving cif=
s_get_tcon
> > >> >>>>>>>>>>> (xid =3D 649) rc =3D 0
> > >> >>>>>>>>>>> [ 4377.457385] CIFS: fs/cifs/connect.c: Tcon rc =3D 0
> > >> >>>>>>>>>>> [ 4377.457388] CIFS: fs/cifs/smb2pdu.c: create/open
> > >> >>>>>>>>>>> [ 4377.457391] CIFS: fs/cifs/transport.c: wait_for_free_=
credits:
> > >> >>>>>>>>>>> remove 1 credits total=3D253
> > >> >>>>>>>>>>> [ 4377.457400] CIFS: fs/cifs/smb2ops.c: Encrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4377.457407] CIFS: fs/cifs/transport.c: Sending smb: s=
mb_len=3D208
> > >> >>>>>>>>>>> [ 4377.458319] CIFS: fs/cifs/connect.c: RFC1002 header 0=
x104
> > >> >>>>>>>>>>> [ 4377.458331] CIFS: fs/cifs/smb2ops.c: Decrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4377.458333] CIFS: fs/cifs/smb2ops.c: mid found
> > >> >>>>>>>>>>> [ 4377.458334] CIFS: fs/cifs/smb2misc.c: SMB2 data lengt=
h 56 offset 152
> > >> >>>>>>>>>>> [ 4377.458336] CIFS: fs/cifs/smb2misc.c: SMB2 len 208
> > >> >>>>>>>>>>> [ 4377.458338] CIFS: fs/cifs/smb2ops.c: smb2_add_credits=
: added 10
> > >> >>>>>>>>>>> credits total=3D263
> > >> >>>>>>>>>>> [ 4377.458362] CIFS: fs/cifs/transport.c: cifs_sync_mid_=
result: cmd=3D5
> > >> >>>>>>>>>>> mid=3D5 state=3D4
> > >> >>>>>>>>>>> [ 4377.458367] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4377.458371] CIFS: fs/cifs/smb2pdu.c: SMB2 IOCTL
> > >> >>>>>>>>>>> [ 4377.458373] CIFS: fs/cifs/transport.c: wait_for_free_=
credits:
> > >> >>>>>>>>>>> remove 1 credits total=3D262
> > >> >>>>>>>>>>> [ 4377.458382] CIFS: fs/cifs/smb2ops.c: Encrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4377.458387] CIFS: fs/cifs/transport.c: Sending smb: s=
mb_len=3D177
> > >> >>>>>>>>>>> [ 4377.459230] CIFS: fs/cifs/connect.c: RFC1002 header 0=
x4cc
> > >> >>>>>>>>>>> [ 4377.459244] CIFS: fs/cifs/smb2ops.c: Decrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4377.459245] CIFS: fs/cifs/smb2ops.c: mid found
> > >> >>>>>>>>>>> [ 4377.459247] CIFS: fs/cifs/smb2misc.c: SMB2 data lengt=
h 1064 offset 112
> > >> >>>>>>>>>>> [ 4377.459248] CIFS: fs/cifs/smb2misc.c: SMB2 len 1176
> > >> >>>>>>>>>>> [ 4377.459250] CIFS: fs/cifs/smb2ops.c: smb2_add_credits=
: added 10
> > >> >>>>>>>>>>> credits total=3D272
> > >> >>>>>>>>>>> [ 4377.459274] CIFS: fs/cifs/transport.c: cifs_sync_mid_=
result: cmd=3D11
> > >> >>>>>>>>>>> mid=3D6 state=3D4
> > >> >>>>>>>>>>> [ 4377.459282] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: adding iface 0
> > >> >>>>>>>>>>> [ 4377.459284] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: speed
> > >> >>>>>>>>>>> 10000000000 bps
> > >> >>>>>>>>>>> [ 4377.459285] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces:
> > >> >>>>>>>>>>> capabilities 0x00000001
> > >> >>>>>>>>>>> [ 4377.459287] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: ipv4
> > >> >>>>>>>>>>> 192.168.0.20
> > >> >>>>>>>>>>> [ 4377.459289] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: adding iface 1
> > >> >>>>>>>>>>> [ 4377.459290] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: speed
> > >> >>>>>>>>>>> 10000000000 bps
> > >> >>>>>>>>>>> [ 4377.459291] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces:
> > >> >>>>>>>>>>> capabilities 0x00000001
> > >> >>>>>>>>>>> [ 4377.459293] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: ipv6
> > >> >>>>>>>>>>> fd40:1eef:5174:0000:f872:6d14:bade:233b
> > >> >>>>>>>>>>> [ 4377.459294] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: adding iface 2
> > >> >>>>>>>>>>> [ 4377.459296] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: speed
> > >> >>>>>>>>>>> 10000000000 bps
> > >> >>>>>>>>>>> [ 4377.459297] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces:
> > >> >>>>>>>>>>> capabilities 0x00000001
> > >> >>>>>>>>>>> [ 4377.459298] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: ipv6
> > >> >>>>>>>>>>> fd40:1eef:5174:0000:7f90:c7fb:ffa7:a8dd
> > >> >>>>>>>>>>> [ 4377.459299] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: adding iface 3
> > >> >>>>>>>>>>> [ 4377.459300] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: speed
> > >> >>>>>>>>>>> 10000000000 bps
> > >> >>>>>>>>>>> [ 4377.459302] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces:
> > >> >>>>>>>>>>> capabilities 0x00000001
> > >> >>>>>>>>>>> [ 4377.459303] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: ipv6
> > >> >>>>>>>>>>> 2001:0470:e1f3:0000:187d:e160:8517:e8df
> > >> >>>>>>>>>>> [ 4377.459304] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: adding iface 4
> > >> >>>>>>>>>>> [ 4377.459305] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: speed
> > >> >>>>>>>>>>> 10000000000 bps
> > >> >>>>>>>>>>> [ 4377.459307] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces:
> > >> >>>>>>>>>>> capabilities 0x00000001
> > >> >>>>>>>>>>> [ 4377.459308] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: ipv6
> > >> >>>>>>>>>>> 2001:0470:e1f3:0000:11c8:9923:c250:1d0e
> > >> >>>>>>>>>>> [ 4377.459309] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: adding iface 5
> > >> >>>>>>>>>>> [ 4377.459310] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: speed
> > >> >>>>>>>>>>> 1000000000 bps
> > >> >>>>>>>>>>> [ 4377.459311] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces:
> > >> >>>>>>>>>>> capabilities 0x00000000
> > >> >>>>>>>>>>> [ 4377.459312] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: ipv4 127.0.0.1
> > >> >>>>>>>>>>> [ 4377.459314] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: adding iface 6
> > >> >>>>>>>>>>> [ 4377.459315] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: speed
> > >> >>>>>>>>>>> 1000000000 bps
> > >> >>>>>>>>>>> [ 4377.459317] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces:
> > >> >>>>>>>>>>> capabilities 0x00000000
> > >> >>>>>>>>>>> [ 4377.459318] CIFS: fs/cifs/smb2ops.c: parse_server_int=
erfaces: ipv6
> > >> >>>>>>>>>>> 0000:0000:0000:0000:0000:0000:0000:0001
> > >> >>>>>>>>>>> [ 4377.459321] CIFS: fs/cifs/smb2pdu.c: Query FSInfo lev=
el 5
> > >> >>>>>>>>>>> [ 4377.459324] CIFS: fs/cifs/transport.c: wait_for_free_=
credits:
> > >> >>>>>>>>>>> remove 1 credits total=3D271
> > >> >>>>>>>>>>> [ 4377.459332] CIFS: fs/cifs/smb2ops.c: Encrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4377.459337] CIFS: fs/cifs/transport.c: Sending smb: s=
mb_len=3D161
> > >> >>>>>>>>>>> [ 4377.460257] CIFS: fs/cifs/connect.c: RFC1002 header 0=
x90
> > >> >>>>>>>>>>> [ 4377.460267] CIFS: fs/cifs/smb2ops.c: Decrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4377.460269] CIFS: fs/cifs/smb2ops.c: mid found
> > >> >>>>>>>>>>> [ 4377.460271] CIFS: fs/cifs/smb2misc.c: SMB2 data lengt=
h 20 offset 72
> > >> >>>>>>>>>>> [ 4377.460272] CIFS: fs/cifs/smb2misc.c: SMB2 len 92
> > >> >>>>>>>>>>> [ 4377.460274] CIFS: fs/cifs/smb2ops.c: smb2_add_credits=
: added 10
> > >> >>>>>>>>>>> credits total=3D281
> > >> >>>>>>>>>>> [ 4377.460299] CIFS: fs/cifs/transport.c: cifs_sync_mid_=
result: cmd=3D16
> > >> >>>>>>>>>>> mid=3D7 state=3D4
> > >> >>>>>>>>>>> [ 4377.460304] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4377.460306] CIFS: fs/cifs/smb2pdu.c: Query FSInfo lev=
el 4
> > >> >>>>>>>>>>> [ 4377.460309] CIFS: fs/cifs/transport.c: wait_for_free_=
credits:
> > >> >>>>>>>>>>> remove 1 credits total=3D280
> > >> >>>>>>>>>>> [ 4377.460317] CIFS: fs/cifs/smb2ops.c: Encrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4377.460322] CIFS: fs/cifs/transport.c: Sending smb: s=
mb_len=3D161
> > >> >>>>>>>>>>> [ 4377.461344] CIFS: fs/cifs/connect.c: RFC1002 header 0=
x84
> > >> >>>>>>>>>>> [ 4377.461356] CIFS: fs/cifs/smb2ops.c: Decrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4377.461359] CIFS: fs/cifs/smb2ops.c: mid found
> > >> >>>>>>>>>>> [ 4377.461361] CIFS: fs/cifs/smb2misc.c: SMB2 data lengt=
h 8 offset 72
> > >> >>>>>>>>>>> [ 4377.461363] CIFS: fs/cifs/smb2misc.c: SMB2 len 80
> > >> >>>>>>>>>>> [ 4377.461366] CIFS: fs/cifs/smb2ops.c: smb2_add_credits=
: added 10
> > >> >>>>>>>>>>> credits total=3D290
> > >> >>>>>>>>>>> [ 4377.461393] CIFS: fs/cifs/transport.c: cifs_sync_mid_=
result: cmd=3D16
> > >> >>>>>>>>>>> mid=3D8 state=3D4
> > >> >>>>>>>>>>> [ 4377.461399] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4377.461401] CIFS: fs/cifs/smb2pdu.c: Query FSInfo lev=
el 1
> > >> >>>>>>>>>>> [ 4377.461403] CIFS: fs/cifs/transport.c: wait_for_free_=
credits:
> > >> >>>>>>>>>>> remove 1 credits total=3D289
> > >> >>>>>>>>>>> [ 4377.461412] CIFS: fs/cifs/smb2ops.c: Encrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4377.461418] CIFS: fs/cifs/transport.c: Sending smb: s=
mb_len=3D161
> > >> >>>>>>>>>>> [ 4377.462309] CIFS: fs/cifs/connect.c: RFC1002 header 0=
x9e
> > >> >>>>>>>>>>> [ 4377.462322] CIFS: fs/cifs/smb2ops.c: Decrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4377.462324] CIFS: fs/cifs/smb2ops.c: mid found
> > >> >>>>>>>>>>> [ 4377.462326] CIFS: fs/cifs/smb2misc.c: SMB2 data lengt=
h 34 offset 72
> > >> >>>>>>>>>>> [ 4377.462329] CIFS: fs/cifs/smb2misc.c: SMB2 len 106
> > >> >>>>>>>>>>> [ 4377.462332] CIFS: fs/cifs/smb2ops.c: smb2_add_credits=
: added 10
> > >> >>>>>>>>>>> credits total=3D299
> > >> >>>>>>>>>>> [ 4377.462358] CIFS: fs/cifs/transport.c: cifs_sync_mid_=
result: cmd=3D16
> > >> >>>>>>>>>>> mid=3D9 state=3D4
> > >> >>>>>>>>>>> [ 4377.462363] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4377.462366] CIFS: fs/cifs/smb2pdu.c: Query FSInfo lev=
el 11
> > >> >>>>>>>>>>> [ 4377.462376] CIFS: fs/cifs/smb2ops.c: Encrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4377.463243] CIFS: fs/cifs/smb2ops.c: Decrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4377.463248] CIFS: fs/cifs/smb2ops.c: mid found
> > >> >>>>>>>>>>> [ 4377.463250] CIFS: fs/cifs/smb2misc.c: SMB2 data lengt=
h 28 offset 72
> > >> >>>>>>>>>>> [ 4377.463278] CIFS: fs/cifs/misc.c: Null buffer passed =
to
> > >> >>>>>>>>>>> cifs_small_buf_release
> > >> >>>>>>>>>>> [ 4377.463283] CIFS: fs/cifs/smb2pdu.c: Close
> > >> >>>>>>>>>>> [ 4377.463293] CIFS: fs/cifs/smb2ops.c: Encrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4377.464259] CIFS: fs/cifs/smb2ops.c: Decrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4377.464262] CIFS: fs/cifs/smb2ops.c: mid found
> > >> >>>>>>>>>>> [ 4377.464291] CIFS: fs/cifs/dfs_cache.c: cache_refresh_=
path: search
> > >> >>>>>>>>>>> path: \cheekon\localnet
> > >> >>>>>>>>>>> [ 4377.464297] CIFS: fs/cifs/dfs_cache.c: get_dfs_referr=
al: get an DFS
> > >> >>>>>>>>>>> referral for \cheekon\localnet
> > >> >>>>>>>>>>> [ 4377.464299] CIFS: fs/cifs/smb2ops.c: smb2_get_dfs_ref=
er: path:
> > >> >>>>>>>>>>> \cheekon\localnet
> > >> >>>>>>>>>>> [ 4377.464302] CIFS: fs/cifs/smb2pdu.c: SMB2 IOCTL
> > >> >>>>>>>>>>> [ 4377.464311] CIFS: fs/cifs/smb2ops.c: Encrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4377.465280] CIFS: fs/cifs/smb2ops.c: Decrypt message =
returned 0
> > >> >>>>>>>>>>> [ 4377.465286] CIFS: fs/cifs/smb2ops.c: mid found
> > >> >>>>>>>>>>> [ 4377.465288] CIFS: fs/cifs/smb2misc.c: SMB2 data lengt=
h 0 offset 0
> > >> >>>>>>>>>>> [ 4377.465322] CIFS: Status code returned 0xc000019c STA=
TUS_FS_DRIVER_REQUIRED
> > >> >>>>>>>>>>> [ 4377.465336] CIFS: fs/cifs/smb2maperror.c: Mapping SMB=
2 status code
> > >> >>>>>>>>>>> 0xc000019c to POSIX err -95
> > >> >>>>>>>>>>> [ 4377.465342] CIFS: fs/cifs/connect.c: is_path_remote: =
full_path:
> > >> >>>>>>>>>>> [ 4377.465347] CIFS: fs/cifs/smb2pdu.c: create/open
> > >> >>>>>>>>>>> [ 4377.466524] CIFS: fs/cifs/smb2pdu.c: Close
> > >> >>>>>>>>>>> [ 4377.467607] CIFS: fs/cifs/smb2pdu.c: create/open
> > >> >>>>>>>>>>> [ 4377.468787] CIFS: fs/cifs/smb2pdu.c: Close
> > >> >>>>>>>>>>> [ 4377.469850] CIFS: fs/cifs/connect.c: VFS: leaving cif=
s_mount (xid =3D
> > >> >>>>>>>>>>> 646) rc =3D 0
> > >> >>>>>>>>>>> [ 4377.469856] CIFS: fs/cifs/sess.c: ses already at max_=
channels (1),
> > >> >>>>>>>>>>> nothing to open
> > >> >>>>>>>>>>> [ 4377.470004] CIFS: fs/cifs/inode.c: VFS: in cifs_root_=
iget as Xid:
> > >> >>>>>>>>>>> 650 with uid: 0
> > >> >>>>>>>>>>> [ 4377.471323] CIFS: fs/cifs/smb2misc.c: Calculated size=
 208 length
> > >> >>>>>>>>>>> 512 mismatch mid 17
> > >> >>>>>>>>>>> [ 4377.471344] CIFS: fs/cifs/smb2misc.c: Calculated size=
 174 length
> > >> >>>>>>>>>>> 512 mismatch mid 18
> > >> >>>>>>>>>>> [ 4377.471347] CIFS: fs/cifs/smb2misc.c: Calculated size=
 124 length
> > >> >>>>>>>>>>> 512 mismatch mid 19
> > >> >>>>>>>>>>> [ 4377.471395] CIFS: fs/cifs/smb2ops.c: get smb3 acl for=
 path
> > >> >>>>>>>>>>> [ 4377.471403] CIFS: fs/cifs/smb2ops.c: VFS: in get_smb2=
_acl_by_path
> > >> >>>>>>>>>>> as Xid: 651 with uid: 0
> > >> >>>>>>>>>>> [ 4377.471409] CIFS: fs/cifs/smb2pdu.c: create/open
> > >> >>>>>>>>>>> [ 4377.472632] CIFS: fs/cifs/smb2pdu.c: Query Info
> > >> >>>>>>>>>>> [ 4377.473671] CIFS: fs/cifs/smb2pdu.c: Close
> > >> >>>>>>>>>>> [ 4377.474729] CIFS: fs/cifs/smb2ops.c: VFS: leaving
> > >> >>>>>>>>>>> get_smb2_acl_by_path (xid =3D 651) rc =3D 0
> > >> >>>>>>>>>>> [ 4377.474733] CIFS: fs/cifs/smb2ops.c: get_smb2_acl_by_=
path: rc =3D 0 ACL len 312
> > >> >>>>>>>>>>> [ 4377.477086] CIFS: fs/cifs/cifsacl.c: sid_to_id: Can't=
 map SID
> > >> >>>>>>>>>>> os:S-1-5-21-122774138-3582407017-3610500266-1001 to a ui=
d
> > >> >>>>>>>>>>> [ 4377.478800] CIFS: fs/cifs/cifsacl.c: sid_to_id: Can't=
 map SID
> > >> >>>>>>>>>>> gs:S-1-22-2-1001 to a gid
> > >> >>>>>>>>>>> [ 4377.478809] CIFS: fs/cifs/inode.c: looking for unique=
id=3D263248
> > >> >>>>>>>>>>> [ 4377.478821] CIFS: fs/cifs/inode.c: cifs_revalidate_ca=
che:
> > >> >>>>>>>>>>> revalidating inode 263248
> > >> >>>>>>>>>>> [ 4377.478823] CIFS: fs/cifs/inode.c: cifs_revalidate_ca=
che: inode 263248 is new
> > >> >>>>>>>>>>> [ 4377.478826] CIFS: fs/cifs/inode.c: VFS: leaving cifs_=
root_iget (xid
> > >> >>>>>>>>>>> =3D 650) rc =3D 0
> > >> >>>>>>>>>>> [ 4377.478830] CIFS: fs/cifs/cifsfs.c: Get root dentry f=
or
> > >> >>>>>>>>>>> [ 4377.478832] CIFS: fs/cifs/cifsfs.c: dentry root is: 0=
000000095b05357
> > >> >>>>>>>>>>> [ 4377.480027] CIFS: fs/cifs/dir.c: VFS: in cifs_lookup =
as Xid: 652
> > >> >>>>>>>>>>> with uid: 1000
> > >> >>>>>>>>>>> [ 4377.480033] CIFS: fs/cifs/dir.c: parent inode =3D 0x0=
0000000cc8fcd81
> > >> >>>>>>>>>>> name is: .Trash and dentry =3D 0x000000001bf85909
> > >> >>>>>>>>>>> [ 4377.480039] CIFS: fs/cifs/dir.c: NULL inode in lookup
> > >> >>>>>>>>>>> [ 4377.480041] CIFS: fs/cifs/dir.c: Full path: \.Trash i=
node =3D
> > >> >>>>>>>>>>> 0x0000000000000000
> > >> >>>>>>>>>>> [ 4377.481529] CIFS: fs/cifs/cifsfs.c: VFS: in cifs_stat=
fs as Xid: 653
> > >> >>>>>>>>>>> with uid: 1000
> > >> >>>>>>>>>>> [ 4377.481861] CIFS: fs/cifs/smb2misc.c: Calculated size=
 73 length 240
> > >> >>>>>>>>>>> mismatch mid 23
> > >> >>>>>>>>>>> [ 4377.481867] CIFS: fs/cifs/smb2misc.c: Calculated size=
 73 length 240
> > >> >>>>>>>>>>> mismatch mid 24
> > >> >>>>>>>>>>> [ 4377.481870] CIFS: fs/cifs/smb2misc.c: Calculated size=
 73 length 240
> > >> >>>>>>>>>>> mismatch mid 25
> > >> >>>>>>>>>>> [ 4377.481885] CIFS: Status code returned 0xc0000034
> > >> >>>>>>>>>>> STATUS_OBJECT_NAME_NOT_FOUND
> > >> >>>>>>>>>>> [ 4377.481893] CIFS: fs/cifs/smb2maperror.c: Mapping SMB=
2 status code
> > >> >>>>>>>>>>> 0xc0000034 to POSIX err -2
> > >> >>>>>>>>>>> [ 4377.481901] CIFS: fs/cifs/inode.c: cifs_get_inode_inf=
o: unhandled err rc -2
> > >> >>>>>>>>>>> [ 4377.481905] CIFS: fs/cifs/dir.c: VFS: leaving cifs_lo=
okup (xid =3D 652) rc =3D -2
> > >> >>>>>>>>>>> [ 4377.481957] CIFS: fs/cifs/dir.c: VFS: in cifs_lookup =
as Xid: 654
> > >> >>>>>>>>>>> with uid: 1000
> > >> >>>>>>>>>>> [ 4377.481960] CIFS: fs/cifs/dir.c: parent inode =3D 0x0=
0000000cc8fcd81
> > >> >>>>>>>>>>> name is: .Trash-1000 and dentry =3D 0x000000007d3b3552
> > >> >>>>>>>>>>> [ 4377.481966] CIFS: fs/cifs/dir.c: NULL inode in lookup
> > >> >>>>>>>>>>> [ 4377.481967] CIFS: fs/cifs/dir.c: Full path: \.Trash-1=
000 inode =3D
> > >> >>>>>>>>>>> 0x0000000000000000
> > >> >>>>>>>>>>> [ 4377.483453] CIFS: fs/cifs/smb2misc.c: Calculated size=
 208 length
> > >> >>>>>>>>>>> 440 mismatch mid 26
> > >> >>>>>>>>>>> [ 4377.483463] CIFS: fs/cifs/smb2misc.c: Calculated size=
 104 length
> > >> >>>>>>>>>>> 440 mismatch mid 27
> > >> >>>>>>>>>>> [ 4377.483466] CIFS: fs/cifs/smb2misc.c: Calculated size=
 124 length
> > >> >>>>>>>>>>> 440 mismatch mid 28
> > >> >>>>>>>>>>> [ 4377.483491] CIFS: fs/cifs/cifsfs.c: VFS: leaving cifs=
_statfs (xid =3D
> > >> >>>>>>>>>>> 653) rc =3D 0
> > >> >>>>>>>>>>> [ 4377.484901] CIFS: Status code returned 0xc0000034
> > >> >>>>>>>>>>> STATUS_OBJECT_NAME_NOT_FOUND
> > >> >>>>>>>>>>> [ 4377.484908] CIFS: fs/cifs/smb2maperror.c: Mapping SMB=
2 status code
> > >> >>>>>>>>>>> 0xc0000034 to POSIX err -2
> > >> >>>>>>>>>>> [ 4377.484913] CIFS: fs/cifs/inode.c: cifs_get_inode_inf=
o: unhandled err rc -2
> > >> >>>>>>>>>>> [ 4377.484916] CIFS: fs/cifs/dir.c: VFS: leaving cifs_lo=
okup (xid =3D 654) rc =3D -2
> > >> >>>>>>>>>>>
> > >> >>>>>>>>>>>
> > >> >>>>>>>>>>>
> > >> >>>>>>>>>>> On Fri, Mar 4, 2022 at 9:01 AM Satadru Pramanik <satadru=
@gmail.com> wrote:
> > >> >>>>>>>>>>>>
> > >> >>>>>>>>>>>> Here is a subset of the recent dmesg during failed moun=
ts, followed by
> > >> >>>>>>>>>>>> an unmount and remount.
> > >> >>>>>>>>>>>>
> > >> >>>>>>>>>>>> On Fri, Mar 4, 2022 at 8:58 AM Satadru Pramanik <satadr=
u@gmail.com> wrote:
> > >> >>>>>>>>>>>>>
> > >> >>>>>>>>>>>>> I have put this in my /etc/rc.local:
> > >> >>>>>>>>>>>>> echo 'module cifs +p' > /sys/kernel/debug/dynamic_debu=
g/control
> > >> >>>>>>>>>>>>> echo 'file fs/cifs/* +p' > /sys/kernel/debug/dynamic_d=
ebug/control
> > >> >>>>>>>>>>>>> echo 7 > /proc/fs/cifs/cifsFYI
> > >> >>>>>>>>>>>>>
> > >> >>>>>>>>>>>>> I ran the commands again manually, and the attached dm=
esg appears to
> > >> >>>>>>>>>>>>> be capturing some of the aforementioned reconnection e=
fforts this
> > >> >>>>>>>>>>>>> morning.
> > >> >>>>>>>>>>>>>
> > >> >>>>>>>>>>>>> On Fri, Mar 4, 2022 at 12:49 AM Shyam Prasad N <nspman=
galore@gmail.com> wrote:
> > >> >>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>> On Wed, Mar 2, 2022 at 8:16 PM Satadru Pramanik <sata=
dru@gmail.com> wrote:
> > >> >>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>> Here is also the dmesg as promised. (After resuming =
from suspend/sleep
> > >> >>>>>>>>>>>>>>> this morning, when I again had the same issue.)
> > >> >>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>> On Wed, Mar 2, 2022 at 2:57 AM Shyam Prasad N <nspma=
ngalore@gmail.com> wrote:
> > >> >>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>> On Wed, Mar 2, 2022 at 3:51 AM Satadru Pramanik <sa=
tadru@gmail.com> wrote:
> > >> >>>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>>> I have put the trace.dat and other debug files her=
e since I can not
> > >> >>>>>>>>>>>>>>>>> attach the files to a message to the list. (Appare=
ntly the trace.dat
> > >> >>>>>>>>>>>>>>>>> file is too large.)
> > >> >>>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>>> https://drive.google.com/drive/folders/1wEi968RbXx=
ivXMMH8J7XUsHhrxu9OWDX?usp=3Dsharing
> > >> >>>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>>> On Mon, Feb 28, 2022 at 11:12 PM Satadru Pramanik =
<satadru@gmail.com> wrote:
> > >> >>>>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>>>> The trace.dat file is attached, covering the peri=
od before suspend,
> > >> >>>>>>>>>>>>>>>>>> and through wake several hours later, when the mo=
unt no longer worked,
> > >> >>>>>>>>>>>>>>>>>> and showed the CIFS: VFS: cifs_tree_connect: coul=
d not find
> > >> >>>>>>>>>>>>>>>>>> superblock: -22 message, and through when I unmou=
nted and remounted
> > >> >>>>>>>>>>>>>>>>>> the share, which then started working.
> > >> >>>>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>>>> On Mon, Feb 28, 2022 at 9:31 AM Satadru Pramanik =
<satadru@gmail.com> wrote:
> > >> >>>>>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>>>>> Here is the DebugData from before and after from=
 the system with the
> > >> >>>>>>>>>>>>>>>>>>> failed mount.
> > >> >>>>>>>>>>>>>>>>>>> Both systems are now running 5.17-rc6.
> > >> >>>>>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>>>>> Working on the trace-cmd now.
> > >> >>>>>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>>>>> On Sun, Feb 27, 2022 at 9:37 PM Steve French <sm=
french@gmail.com> wrote:
> > >> >>>>>>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>>>>>> I would like to see the output of:
> > >> >>>>>>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>>>>>> /proc/fs/cifs/DebugData before and after the fa=
ilure if possible.
> > >> >>>>>>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>>>>>> In addition, there would be some value in seein=
g trace information
> > >> >>>>>>>>>>>>>>>>>>>> (e.g start tracing by
> > >> >>>>>>>>>>>>>>>>>>>> "trace-cmd record -e cifs" before the failure a=
nd then forward the
> > >> >>>>>>>>>>>>>>>>>>>> debug information displayed by "trace-cmd show"=
 after the failure)
> > >> >>>>>>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>>>>>> On Sun, Feb 27, 2022 at 7:55 AM Thorsten Leemhu=
is
> > >> >>>>>>>>>>>>>>>>>>>> <regressions@leemhuis.info> wrote:
> > >> >>>>>>>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>>>>>>> [TLDR: I'm adding the regression report below =
to regzbot, the Linux
> > >> >>>>>>>>>>>>>>>>>>>>> kernel regression tracking bot; all text you f=
ind below is compiled from
> > >> >>>>>>>>>>>>>>>>>>>>> a few templates paragraphs you might have enco=
untered already already
> > >> >>>>>>>>>>>>>>>>>>>>> from similar mails.]
> > >> >>>>>>>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>>>>>>> Hi, this is your Linux kernel regression track=
er. Top-posting for once,
> > >> >>>>>>>>>>>>>>>>>>>>> to make this easily accessible to everyone.
> > >> >>>>>>>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>>>>>>> CCing the regression mailing list, as it shoul=
d be in the loop for all
> > >> >>>>>>>>>>>>>>>>>>>>> regressions, as explained here:
> > >> >>>>>>>>>>>>>>>>>>>>> https://www.kernel.org/doc/html/latest/admin-g=
uide/reporting-issues.html
> > >> >>>>>>>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>>>>>>> To be sure below issue doesn't fall through th=
e cracks unnoticed, I'm
> > >> >>>>>>>>>>>>>>>>>>>>> adding it to regzbot, my Linux kernel regressi=
on tracking bot:
> > >> >>>>>>>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>>>>>>> #regzbot ^introduced v5.16.11..v5.17-rc5
> > >> >>>>>>>>>>>>>>>>>>>>> #regzbot title cifs: Failure to access cifs mo=
unt of samba share after
> > >> >>>>>>>>>>>>>>>>>>>>> resume from sleep
> > >> >>>>>>>>>>>>>>>>>>>>> #regzbot ignore-activity
> > >> >>>>>>>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>>>>>>> Reminder for developers: when fixing the issue=
, please add a 'Link:'
> > >> >>>>>>>>>>>>>>>>>>>>> tags pointing to the report (the mail quoted a=
bove) using
> > >> >>>>>>>>>>>>>>>>>>>>> lore.kernel.org/r/, as explained in
> > >> >>>>>>>>>>>>>>>>>>>>> 'Documentation/process/submitting-patches.rst'=
 and
> > >> >>>>>>>>>>>>>>>>>>>>> 'Documentation/process/5.Posting.rst'. This al=
lows the bot to connect
> > >> >>>>>>>>>>>>>>>>>>>>> the report with any patches posted or committe=
d to fix the issue; this
> > >> >>>>>>>>>>>>>>>>>>>>> again allows the bot to show the current statu=
s of regressions and
> > >> >>>>>>>>>>>>>>>>>>>>> automatically resolve the issue when the fix h=
its the right tree.
> > >> >>>>>>>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>>>>>>> I'm sending this to everyone that got the init=
ial report, to make them
> > >> >>>>>>>>>>>>>>>>>>>>> aware of the tracking. I also hope that messag=
es like this motivate
> > >> >>>>>>>>>>>>>>>>>>>>> people to directly get at least the regression=
 mailing list and ideally
> > >> >>>>>>>>>>>>>>>>>>>>> even regzbot involved when dealing with regres=
sions, as messages like
> > >> >>>>>>>>>>>>>>>>>>>>> this wouldn't be needed then. And don't worry,=
 if I need to send other
> > >> >>>>>>>>>>>>>>>>>>>>> mails regarding this regression only relevant =
for regzbot I'll send them
> > >> >>>>>>>>>>>>>>>>>>>>> to the regressions lists only (with a tag in t=
he subject so people can
> > >> >>>>>>>>>>>>>>>>>>>>> filter them away). With a bit of luck no such =
messages will be needed
> > >> >>>>>>>>>>>>>>>>>>>>> anyway.
> > >> >>>>>>>>>>>>>>>>>>>>>
> > >> >>>>>>>>>>>>>>>>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel'=
s regression tracker' hat)
> > >> >
> > >> >
> > >> >
> >
> >
> >
> > --
> > Regards,
> > Shyam

--000000000000427e5805dc9edc19
Content-Type: application/gzip; name="dmesg.numericip.manualmount.txt.gz"
Content-Disposition: attachment; 
	filename="dmesg.numericip.manualmount.txt.gz"
Content-Transfer-Encoding: base64
Content-ID: <f_l1z5gpbj0>
X-Attachment-Id: f_l1z5gpbj0

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
9R26/wfgdMHLSlsCAA==
--000000000000427e5805dc9edc19--
