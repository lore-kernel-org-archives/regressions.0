Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BF8BE5A
	for <regressions@lists.linux.dev>; Mon, 14 Aug 2023 12:28:20 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-52340d9187aso5615633a12.3
        for <regressions@lists.linux.dev>; Mon, 14 Aug 2023 05:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1692016098; x=1692620898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izsmEiSniL4Vpqa2NF6daalfMmbpg+9Z6Z1Kc+7+ox4=;
        b=CLfVoiMh1sB0QC7DEWNr+AJPXjOCXiRTkBknLkQ0BAm1E8j6pwL+s7tzvft4DAQVM9
         3f6csuTf4gJD4MTv2vdSdQ17bOyG0pkikKOFgJkQgVsMRMsqi0xODkFfvltuUgmDVvBY
         dk6cF1BjxwJLmw03sxMLCFa7ovXAecTrQTnJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692016098; x=1692620898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izsmEiSniL4Vpqa2NF6daalfMmbpg+9Z6Z1Kc+7+ox4=;
        b=jysFt2ree82M3xMh7z0QFBNNSKAKAIu3rtwjrasJyq+ENLJVQppTURqywAVoeYuVpT
         xy/Ohj1/8o6lljiyPz5sjYW+YfXDS4jwSSnd1u8E3IxVa4RLVGiFUH11MOow75n75glS
         SPbeBSpCu3z/7ENOBxEXlr7CYp6/tXtMu3CidDTrYioxjRxNRD/t5JUf14dOvy0v3kim
         9UxpiUBHdPcm53rgEuRpRcsSwVcUj9Sn6nsKWMNZRhnMfXaJcgNNo6xamO8grQljADed
         hHpgbmdb5At/rTq3Lc39ffIC9eY3cwuUpP/dm6U8Jz3w9z1oKSojr2h71ktzgFCKzjvk
         Ra6g==
X-Gm-Message-State: AOJu0Yz+HLV5Fr/WTME9BIIXrZZcblZMXvtY+Mp8CZc4DSfjrcDUh5OF
	mJQfTovsNCQ2Vdq6BiuBfHuBsEeLFb9a4d35Mwzkmw==
X-Google-Smtp-Source: AGHT+IGB9KGGRhBVej7Q/xDzR/9vvDZmK/JkqOEfmuqgJJ1lhO6IXGwof9X8q3cbaMpkykBpZt14zXaapbKCUOQVLRk=
X-Received: by 2002:a17:906:73dc:b0:99d:101b:8403 with SMTP id
 n28-20020a17090673dc00b0099d101b8403mr7579441ejl.36.1692016098647; Mon, 14
 Aug 2023 05:28:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4f66cded234462964899f2a661750d6798a57ec0.camel@bitron.ch>
 <CAJfpeguG4f4S-pq+_EXHxfB63mbof-VnaOy-7a-7seWLMj_xyQ@mail.gmail.com> <da17987a-b096-9ebb-f058-8eb91f15b560@fastmail.fm>
In-Reply-To: <da17987a-b096-9ebb-f058-8eb91f15b560@fastmail.fm>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 14 Aug 2023 14:28:07 +0200
Message-ID: <CAJfpegtUVUDac5_Y7BMJvCHfeicJkNxca2hO1crQjCNFoM54Lg@mail.gmail.com>
Subject: Re: [REGRESSION] fuse: execve() fails with ETXTBSY due to async fuse_flush
To: Bernd Schubert <bernd.schubert@fastmail.fm>
Cc: =?UTF-8?Q?J=C3=BCrg_Billeter?= <j@bitron.ch>, 
	"Eric W. Biederman" <ebiederm@xmission.com>, Tycho Andersen <tycho@tycho.pizza>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Aug 2023 at 14:07, Bernd Schubert <bernd.schubert@fastmail.fm> w=
rote:
>
>
>
> On 8/14/23 13:02, Miklos Szeredi wrote:
> > On Mon, 14 Aug 2023 at 08:03, J=C3=BCrg Billeter <j@bitron.ch> wrote:
> >>
> >> Since v6.3-rc1 commit 5a8bee63b1 ("fuse: in fuse_flush only wait if
> >> someone wants the return code") `fput()` is called asynchronously if a
> >> file is closed as part of a process exiting, i.e., if there was no
> >> explicit `close()` before exit.
> >>
> >> If the file was open for writing, also `put_write_access()` is called
> >> asynchronously as part of the async `fput()`.
> >>
> >> If that newly written file is an executable, attempting to `execve()`
> >> the new file can fail with `ETXTBSY` if it's called after the writer
> >> process exited but before the async `fput()` has run.
> >
> > Thanks for the report.
> >
> > At this point, I think it would be best to revert the original patch,
> > since only v6.4 has it.
> >
> > The original fix was already a workaround, and I don't see a clear
> > path forward in this direction.  We need to see if there's better
> > direction.
> >
> > Ideas?
>
> Is there a good reason to flush O_RDONLY?

->flush() is somewhat of a misnomer, it's the callback for explicit
close(2) and also for implicit close by exit(2).

The reason it's called flush is that nfs/fuse use it to ensure
close-to-open cache consistency, which means flushing dirty data on
close.

On fuse it also used to unlock remote posix locks, and we really know
what other "creative" uses were found for this request.  So while we
could turn off sending FLUSH for read-only case (and use SETLK/F_UNLCK
for the remote lock case) but first let's see a use case.  Sending
FLUSH can already be disabled by returning ENOSYS.

>
> fuse: Avoid flush for O_RDONLY
>
> From: Bernd Schubert <bschubert@ddn.com>
>
> A file opened in read-only moded does not have data to be
> flushed, so no need to send flush at all.
>
> This also mitigates -EBUSY for executables, which is due to
> async flush with commit 5a8bee63b1.

Does it?  If I read the bug report correctly, it's the write case that
causes EBUSY.

Thanks,
Miklos
