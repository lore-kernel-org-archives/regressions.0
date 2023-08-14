Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB93DBA45
	for <regressions@lists.linux.dev>; Mon, 14 Aug 2023 11:02:48 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-99bdcade7fbso544303666b.1
        for <regressions@lists.linux.dev>; Mon, 14 Aug 2023 04:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1692010966; x=1692615766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LT0OaCPd61k3/xuFtTRuhfa3SWYpqLwDHB86rSkZVfA=;
        b=ij7hW52gui9yvHzBS30YckIi9Cf3Ea0ytH2mgr35CspJvPiNTFdCykOo5Wj+CrrU53
         Bqd5SDC3f040JB4H9MHBvYYC30xmKbWh30YKnjOL2bHTW/g36d3zXmbr11IVPgNOMTTG
         qOa9l178XWHWCW7rs61cx0zL6lXYMNazEwU8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692010966; x=1692615766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LT0OaCPd61k3/xuFtTRuhfa3SWYpqLwDHB86rSkZVfA=;
        b=IbVnI/D/tOAkkmFjijzLBIjhipg2u8TZqep3l5RbGgqTFuP4ctCNjArOHHboYYMN52
         kxr8SvYZcSNGClp+egqAwnybrukhnZBOHq+n9tofPD71W7hFfwl3sgKdUBx7d8lqOuvb
         1pSy+MZoh9ry1vdAzGKmm3mNt+5wUz97Fhw2J38bWOzoRL3YEvIHrTkzkw4mHPZY4GeC
         2U5W9SaCqngki9HVp7Ri5Juyu/hL883LGqKJvvMfMUZVB6+CAlyDdH7TlzYiVOYrKWco
         fPx2v56/4XF5ldCMup9qJF8Q/Ju4Myu0tpTL0vMdXpWoFu1eUAsUstJ2VmKUw6JAXNQB
         UVJw==
X-Gm-Message-State: AOJu0YxiOcvHMND0BXJJ1rZJ2m1B+8IluA91ykLgDjGGzCxKTXuzbIbk
	EbBSudW7bGfijnkYoguWly9MEjZp3VFz53floa24NRqbfq96W9kYn5k=
X-Google-Smtp-Source: AGHT+IGAB+8G6IRPlsulIO426V/9zMh3Xv+vnE8M/rUzZ9o9urHDXXVoPA0Mls3ByEUcsReaZOD+ymkaSJO4fHWFd68=
X-Received: by 2002:a17:906:5dc1:b0:988:8be0:3077 with SMTP id
 p1-20020a1709065dc100b009888be03077mr6644363ejv.31.1692010966572; Mon, 14 Aug
 2023 04:02:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4f66cded234462964899f2a661750d6798a57ec0.camel@bitron.ch>
In-Reply-To: <4f66cded234462964899f2a661750d6798a57ec0.camel@bitron.ch>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 14 Aug 2023 13:02:35 +0200
Message-ID: <CAJfpeguG4f4S-pq+_EXHxfB63mbof-VnaOy-7a-7seWLMj_xyQ@mail.gmail.com>
Subject: Re: [REGRESSION] fuse: execve() fails with ETXTBSY due to async fuse_flush
To: =?UTF-8?Q?J=C3=BCrg_Billeter?= <j@bitron.ch>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Tycho Andersen <tycho@tycho.pizza>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Aug 2023 at 08:03, J=C3=BCrg Billeter <j@bitron.ch> wrote:
>
> Since v6.3-rc1 commit 5a8bee63b1 ("fuse: in fuse_flush only wait if
> someone wants the return code") `fput()` is called asynchronously if a
> file is closed as part of a process exiting, i.e., if there was no
> explicit `close()` before exit.
>
> If the file was open for writing, also `put_write_access()` is called
> asynchronously as part of the async `fput()`.
>
> If that newly written file is an executable, attempting to `execve()`
> the new file can fail with `ETXTBSY` if it's called after the writer
> process exited but before the async `fput()` has run.

Thanks for the report.

At this point, I think it would be best to revert the original patch,
since only v6.4 has it.

The original fix was already a workaround, and I don't see a clear
path forward in this direction.  We need to see if there's better
direction.

Ideas?

Thanks,
Miklos
