Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A5914A86
	for <regressions@lists.linux.dev>; Fri, 30 Jun 2023 12:42:17 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b698dd515dso28370421fa.3
        for <regressions@lists.linux.dev>; Fri, 30 Jun 2023 05:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688128936; x=1690720936;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbDHpcHBGV/GXKRXQp6C7hY79PoxtwM87bmH3IPRUy8=;
        b=S95nMNVjz21JUfBjntZ0OBElDugcT8Z1TpM/i6HCRSAH4biC7zVwu8l5DEomnXW6Qy
         O+xptjJ87ZL6y8b+OS3dXV9KKGrT2yEBQ5b1SM9KdqcOwXrQSrkvhWDxINH7qcTPz3vs
         3VDZu5mzPBx74+1YmlQv8nFYdG/cdAs0cMllcDYh++lsPyBVV+qOeXlPnQ3uyyI4bmPq
         ZceMvMn6oxxMym30xxlKu3KAXQVqiAQuG1Orn+jzi5WMx8FrWjqmQObSTKjmHrYtI8BD
         B21zqOk5NDrwBWYCgw6JDeTqVKg45lu1XHYyX0jJhgpQrp4pEWx9qDi6SyqobUmgGoaV
         ctuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688128936; x=1690720936;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbDHpcHBGV/GXKRXQp6C7hY79PoxtwM87bmH3IPRUy8=;
        b=UeYjbiRxZvQL02yo8VhD0ju0rcIXPsNq+yQvCTvuWHMGXOtiFWtB5Iq6MJjRMG4b5a
         Hdiqa1iZNJKOhGX+3H1EtnOU8OzZVg7GePrxgW9tkjKLyMBykbhTUJqsok0CGABIv9KC
         GNzdhdo6/R49zxZ/Un0wtd26Wl+he7aw/6OmHmGO0LouYelpFXi7hKt9uIWoC5S/pfdi
         Mj3wtazJWu+C9ZDytXbk0muQ9Hl3GxdEJ9f1hBvCQ4aP5zDaD3g61TT44gV6AvMOYQqC
         e1ZlGLddzD/JBk3BTGYNcHBkZjV5iCoYAsQA13XOqrtdoiU2wghyEm7ire7wuHmA0XFN
         42Fw==
X-Gm-Message-State: ABy/qLbK9/ZiTY0PjVRoJMt0rM6Nytl2IJLhgp1zVSMrb5xTtzXwLvSl
	TL8lVX5d8xclbnQ1fMufVq8=
X-Google-Smtp-Source: APBJJlGTiAqSH2cksLdLr5lwKG+bvn2CYh0FyAsb9QJcO53Qx04dR+oUXUNEydEGJKBlJr21oFERJg==
X-Received: by 2002:a2e:3512:0:b0:2b6:d5af:1160 with SMTP id z18-20020a2e3512000000b002b6d5af1160mr839056ljz.28.1688128935594;
        Fri, 30 Jun 2023 05:42:15 -0700 (PDT)
Received: from smtpclient.apple ([178.254.237.20])
        by smtp.gmail.com with ESMTPSA id d14-20020a170906370e00b00992e265a22dsm721727ejc.136.2023.06.30.05.42.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Jun 2023 05:42:15 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: Bug Report with kernel 6.3.5
From: Martin Zaharinov <micron10@gmail.com>
In-Reply-To: <ZJ1rC8WieLkJLHFl@debian.me>
Date: Fri, 30 Jun 2023 15:42:04 +0300
Cc: netdev <netdev@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>,
 Linux Regressions <regressions@lists.linux.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F8555BEF-15B3-4CFF-8156-D5B1D6C24736@gmail.com>
References: <20F611B6-2C76-4BD3-852D-8828D27F88EC@gmail.com>
 <ZHwkQcouxweYYhTX@debian.me> <ZJ1rC8WieLkJLHFl@debian.me>
To: Bagas Sanjaya <bagasdotme@gmail.com>
X-Mailer: Apple Mail (2.3731.600.7)

Hi Bagas,

Close for now , if i collect new info will update here .


Thanks,
Martin

> On 29 Jun 2023, at 14:29, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>=20
> On Sun, Jun 04, 2023 at 12:42:25PM +0700, Bagas Sanjaya wrote:
>> On Sun, Jun 04, 2023 at 07:51:36AM +0300, Martin Zaharinov wrote:
>>> Hi Team one bug report=20
>>>=20
>>> after upgrade from kernel 6.2.12 to 6.3.5=20
>>> After fell hour system get this error.
>>>=20
>>> If is possible to check.
>>>=20
>>>=20
>>> Jun  4 01:46:52  [12810.275218][  T587] INFO: task nginx:3977 =
blocked for more than 609 seconds.
>>> Jun  4 01:46:52  [12810.275350][  T587]       Tainted: G           O =
      6.3.5 #1
>>> Jun  4 01:46:52  [12810.275436][  T587] "echo 0 > =
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
>>> Jun  4 01:46:52  [12810.275527][  T587] task:nginx         state:D =
stack:0     pid:3977  ppid:1      flags:0x00000006
>>> Jun  4 01:46:52  [12810.275624][  T587] Call Trace:
>>> Jun  4 01:46:52  [12810.275707][  T587]  <TASK>
>>> Jun  4 01:46:52  [12810.275786][  T587]  __schedule+0x352/0x820
>>> Jun  4 01:46:52  [12810.275878][  T587]  =
schedule_preempt_disabled+0x61/0xe0
>>> Jun  4 01:46:52  [12810.275963][  T587]  =
__mutex_lock.constprop.0+0x481/0x7a0
>>> Jun  4 01:46:52  [12810.276049][  T587]  ? =
__lock_sock_fast+0x1a/0xc0
>>> Jun  4 01:46:52  [12810.276135][  T587]  ? =
lock_sock_nested+0x1a/0xc0
>>> Jun  4 01:46:52  [12810.276217][  T587]  ? =
inode_wait_for_writeback+0x77/0xd0
>>> Jun  4 01:46:52  [12810.276307][  T587]  =
eventpoll_release_file+0x41/0x90
>>> Jun  4 01:46:52  [12810.276416][  T587]  __fput+0x1d9/0x240
>>> Jun  4 01:46:52  [12810.276517][  T587]  task_work_run+0x51/0x80
>>> Jun  4 01:46:52  [12810.276624][  T587]  =
exit_to_user_mode_prepare+0x123/0x130
>>> Jun  4 01:46:52  [12810.276732][  T587]  =
syscall_exit_to_user_mode+0x21/0x110
>>> Jun  4 01:46:52  [12810.276847][  T587]  =
entry_SYSCALL_64_after_hwframe+0x46/0xb0
>>> Jun  4 01:46:52  [12810.276954][  T587] RIP: 0033:0x15037529155a
>>> Jun  4 01:46:52  [12810.277056][  T587] RSP: 002b:000015036bbb6400 =
EFLAGS: 00000293 ORIG_RAX: 0000000000000003
>>> Jun  4 01:46:52  [12810.277185][  T587] RAX: 0000000000000000 RBX: =
000015036bbb7420 RCX: 000015037529155a
>>> Jun  4 01:46:52  [12810.277311][  T587] RDX: 0000000000000000 RSI: =
0000000000000000 RDI: 0000000000000013
>>> Jun  4 01:46:52  [12810.277440][  T587] RBP: 00001503647343d0 R08: =
1999999999999999 R09: 0000000000000000
>>> Jun  4 01:46:52  [12810.277567][  T587] R10: 000015037531baa0 R11: =
0000000000000293 R12: 0000000000000ba5
>>> Jun  4 01:46:52  [12810.277693][  T587] R13: 0000150348731f48 R14: =
0000000000000000 R15: 000000001f5b06b0
>>> Jun  4 01:46:52  [12810.277820][  T587]  </TASK>
>>>=20
>>=20
>> Can you clearly describe this regression? And your nginx setup? And =
most
>> importantly, can you please bisect between v6.2 and v6.3 to find the
>> culprit? Can you also check the mainline?
>>=20
>> Anyway, thanks for the regression report. I'm adding it to regzbot:
>>=20
>> #regzbot ^introduced: v6.2.12..v6.3.5
>> #regzbot title: nginx blocked for more than 10 minutes on 6.3.5
>>=20
>=20
> No reply from Martin (MIA), thus removing from regzbot tracking:
>=20
> #regzbot inconclusive: reporter MIA when being asked to provide =
regression details
>=20
> Thanks.
>=20
> --=20
> An old man doll... just what I always wanted! - Clara


