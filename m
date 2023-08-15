Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA95C3207
	for <regressions@lists.linux.dev>; Tue, 15 Aug 2023 06:11:41 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b9ba3d6157so78775491fa.3
        for <regressions@lists.linux.dev>; Mon, 14 Aug 2023 23:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692079899; x=1692684699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uRmlNp0zVeV/2xZq56pyWJycC87MI6SKt4lbuSPPaQ=;
        b=RixMO+c72EN6CMA7cwO5cA40NZSIJCAL+YfvbGxtQi+qNWO77CYMEAkmlEZxPxVf+2
         oFEuEI8Wy3NAjfomoBrafT/Vfd3w2go6PjwAwtZykgf8RfTSe4GNd/dPbck4k7k941V4
         lsp/oC9NwnAZ91FjPDv3CZubs8ntI5LYx38xWs+H+EMgAdEyLpIZxS2biBJBOwIZOeS6
         HRHfp35h2nKMP79/32GIB8HZSp+aOm6F85pE4T1JpCLdwPOQSr1DXuxj8NovkE92UeiP
         ZmJVDJCBikEbRpWB8Lj2WQirBPd9v023p6KiOJlmaw55JViZttGWmjStw3wmc7sRkNBI
         4tKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692079899; x=1692684699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uRmlNp0zVeV/2xZq56pyWJycC87MI6SKt4lbuSPPaQ=;
        b=BYC5X0aarnBMoR4nx4K9B91Q/qqmvXO/ad+M9Ny6HjktwONzHRgiCgvsI+VHRBZ1+q
         uYhgnvmdjz79xUOHZUfshrKy3JBpB/8ZMA28hVkCLRqdOzqPcrRJmpAlDM7MO1mWPiCV
         cxfGebnX2yLnzBSoXpBd24/L79uortvmmokI45i7O5IJflw8JiQoZ0AhJo9buuLiEQq0
         8JYq7P7POBTZu1MxG39SvJZ+iuPNnIk/la7dSvQEO3fBBq3DkB8d5gXDglrrE5fBG90r
         o1WmKvugmrDUMh2I1//EK/AYj8YaWyw75DvZFuibWyOSzqmW91HScYrCj4ItBv3B6Ldl
         mMVg==
X-Gm-Message-State: AOJu0Yz9uDcfQys+WVwyDbYWIK5uW1f3Xcv7qot5UTqJGsEpN2S436ek
	KYNE+PVCQlNkPrJaEtsrarSInpyEghZuC9CtO+A=
X-Google-Smtp-Source: AGHT+IFQSCQw7lJnipy721GFX6ZIrO8Uvr6+vFiWWFVsa/Y8aqt4FOFC3qMVy58dw3me6QoZzaGkVuZsC/YFS2aBofM=
X-Received: by 2002:a2e:b0dc:0:b0:2b9:dfd1:3803 with SMTP id
 g28-20020a2eb0dc000000b002b9dfd13803mr8691959ljl.30.1692079899079; Mon, 14
 Aug 2023 23:11:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+prNOpqd2Tk1tiBAa9MT6ZPxB5gj9ftxOhaZ-u1WEay9H-oHQ@mail.gmail.com>
 <20230815053132.GB22301@1wt.eu>
In-Reply-To: <20230815053132.GB22301@1wt.eu>
From: Xuancong Wang <xuancong84@gmail.com>
Date: Tue, 15 Aug 2023 14:11:28 +0800
Message-ID: <CA+prNOrUVWM9-vozUZyW49-m=qFWZR3JAtikZb4T1EimV0ZCDw@mail.gmail.com>
Subject: Re: A small bug in file access control that all have neglected
To: Willy Tarreau <w@1wt.eu>
Cc: security@kernel.org, stable@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, by "full access", I mean `chmod 777`. You can easily reproduce
this bug on any Linux machine by typing the following commands:

xuancong@mx:~$ sudo su
root@mx:/home/xuancong# echo yes >a
root@mx:/home/xuancong# chmod 777 a
root@mx:/home/xuancong#
exit
xuancong@mx:~$ echo no >>a
xuancong@mx:~$ cat a
yes
no
xuancong@mx:~$ ls -al a
-rwxrwxrwx 1 root root 7 Aug 15 14:08 a
xuancong@mx:~$ touch -m a
touch: setting times of 'a': Operation not permitted
xuancong@mx:~$ python -c "import os,sys;os.utime('a',(1,1))"
Traceback (most recent call last):
  File "<string>", line 1, in <module>
PermissionError: [Errno 1] Operation not permitted


Cheers,
Xuancong

On Tue, Aug 15, 2023 at 1:31=E2=80=AFPM Willy Tarreau <w@1wt.eu> wrote:
>
> Hello,
>
> On Tue, Aug 15, 2023 at 11:42:55AM +0800, Xuancong Wang wrote:
> > Dear all,
> >
> > I found in all versions of Linux (at least for kernel version 4/5/6), t=
he
> > following bug exists:
> > When a user is granted full access to a file of which he is not the own=
er,
> > he can read/write/delete the file, but cannot "change only its last
> > modification date". In particular, `touch -m` fails and Python's
> > `os.utime()` also fails with "Operation not permitted", but `touch` wit=
hout
> > -m works.
> >
> > This applies to both FACL extended permission as well as basic Linux fi=
le
> > permission.
> >
> > Thank you for fixing this in the future!
>
> Your description is unclear to me, particularly what you call "is
> granted full access": do you mean chmod here ? If so, you can't
> delete it, so maybe you mean something else ? You should share a
> full reproducer showing the problem. Also, the fact that one
> command (touch) works and another one (python) does not indicates
> they don't do the same thing. So I suspect it's more related to
> the way the file is accessed where both commands use different
> semantics. As such, using strace on both commands showing the
> sequence accessing that file will reveal the difference and very
> likely explain why one can and the other cannot change the last
> modification date.
>
> Willy
>
> PS: there's no need to keep security@ here, it's used to dispatch
>     issues to maintainers and coordinate fixes, now that your report
>     is public it will not bring anything anymore.
