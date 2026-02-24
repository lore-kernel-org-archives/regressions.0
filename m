Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CD139E175
	for <regressions@lists.linux.dev>; Tue, 24 Feb 2026 14:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771942445; cv=pass; b=sDyptieo0ICTBVGozibGFiBsP9AoEf/3DxaXF87hXHWNfMNWmSugYNFyysHFormo9HsqMWGPPdo1mjbIiuAFWZR770vW9Qpot/Y7of0DmwBzP+Shv3UveseoR1N0XDiUhVhmKb2elOTpG44W4qxXScPdRpt2aDErsWu7efJJXes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771942445; c=relaxed/simple;
	bh=X2u1sa8cXw7f3fhCTsjaFodXR3TO0s3l+pgy2+3Z0AY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hhdx4f9f34nlzmZAZLitjtXVXBDs3xoSVgxgndbGReCVavffWS0jIkdJ9rmb9eCqWo5jSRHNnZM8akBJOA4AlCnmDhzrtmrcsRyJr3nhA+eE8kGKnfDyzx7O3efYkACtrZfsXlDMUhg4P8aXi3OM92a1uqRdQa24QxQqQ0rrCEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lR2Eh3gS; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lR2Eh3gS"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2bd801b40dbso241576eec.0
        for <regressions@lists.linux.dev>; Tue, 24 Feb 2026 06:14:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771942443; cv=none;
        d=google.com; s=arc-20240605;
        b=k4nhgrTqmDQSjUwKTtJRgvXrX7i7we+teqp1vbDf4hr64/2Az6gfhs9DYq39Ga0D8D
         LoUHWrMqGWOOxq504eKpixgbZAuGzERaipAtGAUMgpXH+HqJ6qXaeEIU2uSUC8qtfILg
         NUP+vdzRPmeBB9UITFz0zQQTGPOT5QfAovzUHpTmENIqFXazc0exbb9PXfo+T4+Q/QeF
         vsaLoug0YhgNUSpkpuiiaQbwsJJkA2s/Cy/HI6w9dKB3X+nSDmp//KjGvoZfRNmOXtPs
         TirVygNe7X+9/9S5TTHqJXmqu74ACxiD0zPu4YUd2jCMOt+MGRjiTJk0vjthvNAH11Kn
         nhyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X2u1sa8cXw7f3fhCTsjaFodXR3TO0s3l+pgy2+3Z0AY=;
        fh=TKbF+muCjooBQ6Y/EXCSVKk8iurkyvwvJGFq2ClxwkY=;
        b=XO2HvVNuqyzbyQOZYlPV6m9so4Yzsz+eL77WYu6z2DRv1oPB2RG0UaLKmawtpd4q0u
         br8w0Rx7UHjL5wCrvt9bba7XMpEOTHveQcve6P4jk9E6I8iP/aR0jdT+ovbs7jZjcV6h
         XCLSftgR5J7f4eHVU+VKh/05PRPZZY9rJkJtwvJdo5l11pY2has4tQHQLPw8RACYioxJ
         U6qAEzHlM0xo3eqLTXSV0114dn9MMCAMbNHAKznGW4yBFNhd7N5lJKTBW9+/Yp32mgky
         x/xffx0lg4KNUAXcKf2ZZWup3mYhP6GTv3cIHp3gScVNzrk6jew/i4edXfBCO9eGMclL
         2ZAA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771942443; x=1772547243; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2u1sa8cXw7f3fhCTsjaFodXR3TO0s3l+pgy2+3Z0AY=;
        b=lR2Eh3gS/iGyjvHDjIBMjKSY0mHwldTklW0nQJD30iN8VWhVwUIwYWySE3wthdkeOc
         A/QwG1Hug/dg3CEAX1A0ksZg80tyyIOfwVpSfcYlvt4wHZo2KG4lMKU9junPSSRK5RYb
         1DjOcKduXG7gu+QFdLraPZdQRHL6WjdQyTnB45FKhXz082YDcSB1lpRXMdiZq12Cgl36
         tC7itQUw+8UQ3SZ1hV2Ut1ORL3J72wpP1BzhT+hJOD/UsMEwScUFm+hI/r02vMvhVe54
         hdN6CVdAovjCosOqecSwHpKXvsBRBWm7Z03mTZsPDHJwSq0HZE58sljxT4aBh4gX6dkg
         oSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771942443; x=1772547243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X2u1sa8cXw7f3fhCTsjaFodXR3TO0s3l+pgy2+3Z0AY=;
        b=sMLTmkePJFSzuDr5el3VReKql1uB8CiKAxawUO0ISjNuGnEfgWCRjBJ2qjtwX+W8L3
         TeaTw0e3yga+yCn3UhyY9Kl/2sZJgkdXrazTM3Ji3aBOUsUxqpsPWDKnjHVaY4tOb9Ef
         w0KPKuYgjk14nHmxymHLlK/PaVqZOBeBhnw6p4KNDQfxGSEkgAJEL/TSGi2Ku2tVhxsp
         2iTk+6HENlTfAHSvx/Ahtb0Uk5zZoM3gJxs78GOQrbasq1GZjkVpYbsKvYYGOtQr09WU
         8RjJU50dxe52l3DGF9XASgWo6gzLQZ+YSegWUoqsqqZ6+nMa4FOM1dX9QpTMmySncSEu
         OOLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9mHR+0NAaFYOK1sjkTpqYIrR+Fe2Fqxp4PAmyy7g7Yzk7RtrExHqMsb5Qo17NZKkUGUZGiRXoFzl/Aw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwL4iHoOCv15qhgZRxNCI2vptf5w0HlNBjnjjV4A8/3ASjipdvD
	kZhL1NqrBF5jIAMNcdWJuNVHP6aEiPMsXxKpeTeRVMob5gm5+H5dilGbMeNy8ActT7DW3UdVe/u
	StsPdVRJ0f4tM2u5IZLsduMqswmaKLcs=
X-Gm-Gg: AZuq6aKAWVaHmcmrnKhsNsAPt0/KSEFWEHN7zNvrLLcXW1eBtUSnuNtgHXyMiYRp447
	Kc36BT5V3KApzAYEp+CwkECJDi+BoFKhCofbphWQzakcp6ygmXZOnjlwiHkSAx43BnRsmibmHOk
	jcxKG5KKjzl8T228aHZlPhOOrQmpMWbhqOxnGaYzFv44vf6NN+q1P0LGwmYgWDj721om4jXZQwW
	rJYTla6WbKD2CAYfOU21PCbSSOT//jLvVAcN5r1tD4HJTZQHzLEvO3jq9w92MLeGr5LO+48PEuJ
	nnysBeXIwKpw8xZHyurxS3ySPMxZipL7uneB1SpTUP8cVn34JLBRqYzQFNySbgJV49YJ6vpuLFW
	JQcQD
X-Received: by 2002:a05:7022:6713:b0:124:af80:9d0c with SMTP id
 a92af1059eb24-1276ac5e868mr2364261c88.0.1771942442816; Tue, 24 Feb 2026
 06:14:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPM=9txvCxvz_NH1zw9WpeCiYYGOxN36Lz1owmbbjfaB2tmjPA@mail.gmail.com>
 <b4f8ca7a-02b1-4e72-896b-87a00db6338b@leemhuis.info> <CAPM=9tw4xWxwGSr=SMQKjWL2R_LfA-b9joYNMqZXM0atis=10Q@mail.gmail.com>
 <CAPM=9ty9T5uC6YiU73G3Y7cEeTpxh4TafmJB=QB+fvcgTvK2BA@mail.gmail.com>
In-Reply-To: <CAPM=9ty9T5uC6YiU73G3Y7cEeTpxh4TafmJB=QB+fvcgTvK2BA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Feb 2026 09:13:51 -0500
X-Gm-Features: AaiRm51EbOro9HI59W14g0qXUGJ50oTIbGZguxl6JG5x_VcuGjQElINW7NxLpTc
Message-ID: <CADnq5_N_ktiuYTHskkpVkWD60t_YMUrXpQPhPE+Zo_wiJ5sAgg@mail.gmail.com>
Subject: Re: Time from regression report to a merge of a fix (was Re: [git
 pull] drm fixes for 7.0-rc1)
To: Dave Airlie <airlied@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, 
	Alex Deucher <alexander.deucher@amd.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Imre Deak <imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 2:24=E2=80=AFAM Dave Airlie <airlied@gmail.com> wro=
te:
>
> On Tue, 24 Feb 2026 at 16:50, Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Mon, 23 Feb 2026 at 22:52, Thorsten Leemhuis
> > <regressions@leemhuis.info> wrote:
> > >
> > > Lo!
> > >
> > > On 2/20/26 21:53, Dave Airlie wrote:
> > > >
> > > > This is the fixes and cleanups for the end of the merge window, it'=
s
> > > > nearly all amdgpu, with some amdkfd, then a pagemap core fix, i915/=
xe
> > > > display fixes, and some xe driver fixes. Nothing seems out of the
> > > > ordinary, except amdgpu is a little more volume than usual.
> > > >
> > > > Let me know if there are any issues,
> > >
> > > Well, there were two fixes in here that made me wonder if our process=
es
> > > need some optimization to get regressions fixed at least somewhat as
> > > fast as Linus wants them to be fixed[1]:
> > >
> > > * One fix in here was for a amdgpu regression introduced in v6.19-rc6
> > > (and also affecting many stable series due to backports). The fix was
> > > ready within ~2 days and could even have made v6.19 -- but it only
> > > reached mainline through this PR on Friday. IOW: After two weeks. Whi=
ch
> > > got me wondering, "Should we do something to merge fixes like that
> > > faster"? And yes, it's the merge window =E2=80=93 but that's also whe=
n Arch
> > > Linux and openSUSE Tumbleweed usually jump to the latest mainline ser=
ies
> > > and thus expose regressions like this to many users, so I guess it wo=
uld
> > > be good to get them fixed at least as fast as outside of merge window=
s.
>
> I think due to the patch pipeline depth and volume that amdgpu and
> i915/xe are dealing with we may need to consider some better
> regression revert pipelines,
>
> The problem is most patches get fed into the start of their -next
> pipelines, where CI etc picks up on them, but there isn't enough
> urgency to create separate trees or pulls outside the regular fixes
> ones.
>
> The amdgpu one definitely should have been fixed in 6.19, Alex any
> idea how we can alleviate that sort of problem, esp if a bug has
> multiple regression reports.

I guess I should have done an additional -fixes PR that week.
Normally I would have been sure to include in the following weeks
-fixes PR, but this was the last one of the cycle.

Alex

>
> > >
> > > * One fix in here was for a i915/xe regression introduced in v6.18-rc=
1.
> > > Once reported, it took about six weeks to get fixed =E2=80=93 and the=
n nearly 10
> > > days for the fix to reach mainline. Looking at this, I once more
> > > wondered if this could have been merged faster. But even more I wonde=
red
> > > why the culprit wasn't reverted, as that's what Linus afaics wants wh=
en
> > > it takes this long.
>
> I think for the i915 one the problem patch should have been reverted
> asap, but I just don't think there was a responsible person to do it,
> maintainers need to be in the loop for these sort of problems, but if
> they aren't in the loop and the regression sits in the bug tracker
> without them being looped on it, we rely on the reporter or developer
> to find it and do the right thing. Esp when developers are head down
> on fixing it, but then it doesn't get flagged as urgent once it goes
> into the -next pipeline and so on. We don't usually break the weekly
> fixes cycles for drm, because CI backlogs and other things it just
> fits nicely, if we do have regressions like this it might be that we
> need to start having urgent PRs out of cycle, which I don't object to,
> it's just a matter of whether maintainers can have this sort of
> insight into patches in the pipeline when there is quite a long
> backlog.
>
> Thanks for the detailed analysis, I've cc'ed some more Intel people.
>
> Dave.
