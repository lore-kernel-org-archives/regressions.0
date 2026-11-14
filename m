Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794671011;
	b=BckNDWmyWnub5VhaflvYk3zDbKzIbmSIWcd62uNgwXmtl+z0BUwAv5rHVmbSnudVVblg
	 uWHNNwWfek6hJzJgSePdMhrEkyPUOEt2t8H7P1RMcQur+0qkfGcm5kAW4dCH4TLCGzfVL
	 S6nPW4p9RW+QMB2Vr31tf9Fbf0DsTXeriMXVGwFfqXwzh15X7eKcKT0Hzgef/7biVLKa3
	 j5r9Z56kCDFujj+ymoeAqGz2INSDV0TFsZ6MGNJL9VN64TkgrEdklEMfawpFh194QV3Wc
	 tM2uvJJMyTZcqxwXqd2P3hCHAFhLIf7ajpw2qa5YOiu+2q9zDQOiheakKJe0979EQZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794671011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/8Am712/UKZMknyahwOgZ7GXCeTB3l6oZgw5VLnohk4=;
	b=UEPwpv2yTiWqTnyHIH9uZ2UM5lJOdJHvWStHrRXtddp+lkNm3pAan8Uu+puw9xWiOyPJ
	 xg82BsJbUo5GQXX1/GfgIHAaKqbNyDijFWNml+PtdoMlIATgEV3CQfDxzCcueRc7oH8Fb
	 it2v+Pn6tdmAc33821XE70zRMWvrMroeAcdClgFaRqtE1eNEKVtW28U16hYqEpbxCuoq7
	 VBaGmw+qdtup1RfO2xI3zRgyntunJx+WHue+sqg6TVcLPrx5Le4c91RPYEshCHchG4U3+
	 yKEnTsjE3HYR//m4NbXUU9BuSC6rOdSpmLxYW331t3HJkZgkToP62/pl5JXURvNTj/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SiAx2V1p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB18606A333
	for <regressions@lists.linux.dev>; Sat, 14 Nov 2026 15:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAB18606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SiAx2V1p
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2612205eec.0
        for <regressions@lists.linux.dev>; Sat, 14 Nov 2026 07:43:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794671010; cv=none;
        d=google.com; s=arc-20260327;
        b=sRq9L20xM6ifMC4FtDACx9GkLSrhnMFPgTbmdKRG6CbY4s4IkuC+bSk+6DP67MX5gh
         EFTb+z8TOMyKRJB3AH6jKFRRZpIbI9W5UePNjtjOTWUaEltDSR8lptE+eSGFzc6IDZPO
         PyjgMcgC6xQIrZtY2Q9ynOhtty+JlQPXEsG3byqBBMP650AqA/sM5lerDp4KM2MS10wm
         7UsTtMoK7/Z3Nd/vzZ6uhRQW/1SwhT52v8NUjPcdGYK3mwQLFb0gWffoOWDZtNBqBD4P
         k5ZX9cqaWOt50Gv1Q1bpkbmrwR3gXsWHWy+2IpbhgwGXXV3rHC6clJpvRi2Ra/81+/wa
         VIMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/8Am712/UKZMknyahwOgZ7GXCeTB3l6oZgw5VLnohk4=;
        fh=gaJk/hvvzA97b/w7Uq6FMb2T6G/FWmDuCVihl40gMjE=;
        b=evrw67HogzByctJF9V8h7ioOO7EKkY69B43OtbdIzV8ZtGF76DMKhwsMl+EWWAAeH7
         tz2gcT55x06zmc2WN1dfFNBl7bxCeYtxOBiNPLrdAcBnGSl7aNJS6yB1r3u3DY3RTWQo
         l35HqVqrsvV/g7t8VDkuQ3ZteapEnyg/DWiU3K6cfQivBVoALQgPpR8H0Oaqmah2vm+N
         cqFS8kL+j3CAK2J6uhy59eRT5E/mIn1N/pmmlxmk7E+4wIqZBrLPQssPuX4buf5zLZgv
         L7pPTOMHb4+QOHlAXAYcghDb348Dh6tmhYpCEaKTY2cUelJSnxUGouxVDBgYw+j2PPX+
         sI7Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794671010; x=1795275810; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/8Am712/UKZMknyahwOgZ7GXCeTB3l6oZgw5VLnohk4=;
        b=SiAx2V1pd2NoisFGfitAycfgkBXrBtYiyafjJE15elb1JGpxoIfkw5zyt0ZkwPMCeY
         0rwjT28CEg6Ew0rK1oA5yh/va+J2y2VFYQ96ys66qnt9Ru2NpGYfs4EHkjTHooxXs9MA
         drE3N1eBiK/bjgyqJ3xc9M39MWRrlvg6nvxx4A8RinyFRiPg52iv3D940EKF9JTnIrVd
         7wXsznBfclYuf79+a6D83gWVMQ8P38maaQ8jBKdi8nEHnqGjyd4aaemO+1aReOn9Bra3
         YvxL7c2ey5/gwlTz5vVHWkEDTIiHQqragMf1OPx7fIjZewe2PL7bpuVddezU465mDTJV
         z3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794671010; x=1795275810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/8Am712/UKZMknyahwOgZ7GXCeTB3l6oZgw5VLnohk4=;
        b=QJZLNnctAoWwLklzXWrVjTE/c98iLCc3OI9jKjQJX8Fv/ss2YhpYT2UD+Ngxe6/OWE
         +yOqob+e/wR/ysAvI1DuE4Bt4IfwLTeBRKsRd314JHVuX2QJb4878uLcGx4LKB9kyBLy
         upTc3Ga2CwxCL/+mQfHffKDfqm9AqmGI7V4ewPmOSqi53+y3E7+1SzwLqxBIknD+Jc9o
         9jbWZkg0wTjYmWrVnO2CuSDQCBKP6k0oaECvBkhjgFexA61ComjUssWHHbSW2P811xSQ
         TzocChUcnO909m/VyfTbjtWIPChS/DnJ5JoayfB6paBjs8L0rzPL3wkYxrb2e2z90Mho
         WyPQ==
X-Forwarded-Encrypted: i=1; AL+hErF8XZSA1EkKlehN3d23dChs3juSveiaona3QxoGCmdKx/IiZQUy1Ix/DRRRPUthnVtmCpnSFkn1hZ6Zig==@lists.linux.dev
X-Gm-Message-State: APuU4Z/N2Hxyb1ro+Ft0GuRZap4s7con1oomT4rh0JScjbDJna75zGFS
	WfbW51+QmvCUcK0teIgwzDEr3LnQNEO+/8tZhCQt0F7H4nMWWTCupUH0+BpeMKAiCyBrQwfxWd4
	NlTIAUsVMrx5D60KqYJTxgxHoSOJ5V40=
X-Gm-Gg: AYBFou0tbORgwYQ8jAQwW9CGjjMhQZyCeca5pFYnLvNvwHG9FCDXipYPFXtzVl6nN8x
	7RtcQwxADA5p4ahRw1B8PHjGUy4qd5nQeAwo971lI2qM1IrtOeBl7b76VPSJe+z39rCQAh4NEuA
	1HOssBMEKFFv4XusjytOEJp3l5KL9nnIvtVpSvh64pxpPMTMW+uh+6sWhgAf7ZlLlpT/aIlrTAw
	goMZzxpVc2a4U0rBcsoI4/CLL4FG41pa6SX+K1Pzd3ecPshHrFEDiNQAi2eGBOelaUoWNhKOHxP
	kaZ2z9HbDvOtOfimaokAWBYv0mxX34I31jJqk4FF1gKHxZR3dpdxrEprvw/8Ln/GZ+6xHKMJKXA
	/2RywvGLrjj+9fOEDyHAafBDm7lydfQQUpWHuGAzTx1vCeDMWLOeVm+1ilkcNlZKuz1ph1jjcM0
	FCYRC52cNMAoT/16Wmrnyol1oFDi/JPHofv++K6Ixx5A==
X-Received: by 2002:a05:7300:b284:b0:35e:2c6:d46c with SMTP id
 5a478bee46e88-37966e3abf5mr6101065eec.10.1794671010025; Sat, 14 Nov 2026
 07:43:30 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAJ6F8CFSfgdZqaKMndGZtbaww32Xr_KVL3gA_2Jemgv9i9vskg@mail.gmail.com>
 <CAJ6F8CFgkgksyk6YM3NdMkQNhSFWV4depC4c-mHvpDHpnjhM-Q@mail.gmail.com> <6ab4a114-57b2-40c7-99d4-55a4ac4c9a9c@leemhuis.info>
In-Reply-To: <6ab4a114-57b2-40c7-99d4-55a4ac4c9a9c@leemhuis.info>
From: =?UTF-8?Q?Cl=C3=A9ment_Smagghe?= <cle.smagghe@gmail.com>
Date: Sat, 14 Nov 2026 16:43:19 +0100
X-Gm-Features: AclHuK9JZCuhMb1uoaKigZDdQKHU-3gJV6cHqPK13T6gU6gv_wW71frzsK9rTyg
Message-ID: <CAJ6F8CHzm4=ryY+j3ao6doR=-67Lq=3-w-kbhk1wdvtYDhyNeA@mail.gmail.com>
Subject: Re: [REGRESSION] ntfs3: existing files/dirs with ':' in their name
 became inaccessible in 7.3 (ads on by default)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev, 
	regressions@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hungyu Lin <dennylin0707@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 11/14/26 14:11, Thorsten Leemhuis wrote:
> Thx for the reports. This sounds a lot like a problem Hungyu Lin is
> trying to fix with these patches:
>
> [PATCH] fs/ntfs3: preserve colons in symlink targets
> https://lore.kernel.org/all/20261029203457.59990-1-dennylin0707@gmail.com=
/
>
> [PATCH] fs/ntfs3: preserve colons in volume labels
> https://lore.kernel.org/all/20261029225856.1173-1-dennylin0707@gmail.com/
>
> Please look into those -- and if your's is a different problem, please
> report back.
>
> Ciao, Thorsten

Thanks, Thorsten. I looked at both patches. They share the same root
cause as my report (ntfs_nls_to_utf16() splitting names at ':' since
be310476e886), but they fix different call sites and do not cover my
case, so I believe this is a separate problem.

- "preserve colons in symlink targets" adds a parse_ads argument to
  ntfs_nls_to_utf16() and passes false only from
  ntfs_create_reparse_buffer(). All other callers explicitly keep
  parse_ads =3D true, in particular ntfs_lookup(), fill_name_de(),
  ntfs_d_hash() and ntfs_d_compare(). The commit message even says
  "Keep parsing enabled for the other callers to preserve their
  existing behavior."

- "preserve colons in volume labels" only changes ntfs_set_label()
  in fsntfs.c.

My problem is in the lookup path: an existing directory entry whose
name contains an interior ':' (e.g. "Reverse: 1999") is returned by
readdir, but ntfs_lookup() converts the name with ADS parsing still
enabled, looks up the stream " 1999" of a non-existent file
"Reverse", and fails with ENOENT. With both patches applied this
path is unchanged, so stat/open/rename/unlink on such entries would
still fail. Only mounting with 'ads=3D0' restores access.

So I think the lookup case needs its own fix, e.g. one of:
  - make 'ads' opt-in (default off), as before 7.3, or
  - in ntfs_lookup() (and the dcache hash/compare helpers), first try
    the full name as a regular directory entry and only fall back to
    the file:stream interpretation if that fails;
plus accepting 'noads' like the other options, since today only
'ads=3D0' works.

I'm happy to test patches.

Thanks,
Cl=C3=A9ment Smagghe
