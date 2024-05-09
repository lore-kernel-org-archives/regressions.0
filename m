Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270C9839E0
	for <regressions@lists.linux.dev>; Thu,  9 May 2024 21:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715289116; cv=none; b=WcQyhhe4nVBGWsw/yftFApHur/fewaK5d1/YwLINLhMXa3Su+opa7Xyyl/yLABN2vEo7f52MlWDwnkl1LuuxkZK/3KpPpk/nuK5szavn++r9XC+8L+XP+yNwLbIghUmNUzUTMMLZYA6vTnNncIEb4LIJZ6V2UES+MRu2WDwyXQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715289116; c=relaxed/simple;
	bh=GoXYrd7dicaqnmSpnOwygXCpC2py7G+x/HeNV0GmZKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IfQ08jDCCJAuLpfr3TJYEhyRVuZPK8Bx9MJqkY31ZUfQmb8r3oD+dOMvmf7OveeYDf5nIaloOZ0dlXuK9KrdGe5FHJGR4Xr3Pv1XeQWhj3Qo8UChD0yNAG8i1o379mpQm5c/8qYtJJxwtnzE2GlwlACHkEi3CFVTpReiy6iDHYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y+7TxKDg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y+7TxKDg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715289113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2kHA6/aeevN+iRF1+w07RanccRf9FAorS/DmVI5C2io=;
	b=Y+7TxKDgv8qw3I8lvDKXO8Iln3gIG/lczq0DvfG0QwfYC6a+qoa21+OqyiHeT85SePdNms
	x/cWcHYjXnhEJ70o9h7DJb8F9R3VGe90tCMnlO5wCyUhwgKgczUih80/HPqS464FA3kA5d
	3jQ/6RXqKP2W3v9WuCgX3ejsWrbRMmY=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-OuJlzuBBOw6JSM9fsMTsXQ-1; Thu, 09 May 2024 17:11:52 -0400
X-MC-Unique: OuJlzuBBOw6JSM9fsMTsXQ-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6f47c380709so1022072b3a.3
        for <regressions@lists.linux.dev>; Thu, 09 May 2024 14:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715289111; x=1715893911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2kHA6/aeevN+iRF1+w07RanccRf9FAorS/DmVI5C2io=;
        b=IFnPvePm3AymtfKzh9KTsERiYHvG5/+MVPb90YzwEMT38ZoaU5mupBN/czsut4mUMY
         eh1PqxtBfxkgJXXTR0EapPD2b3/8pSgkq/LpuzGynN0iwwGOvaoLo4+hJrYaYZy1ZuLB
         kexgo4oVHhRiShFTEJvLcyC+vV7ZkDpfLQoh5uSNQHdggGayDckGxkggcne28fRJq3po
         zMIGUGr9/pptC93FdT9GztW9bg9jKVBo2cJukKNakI8oMMHm89QJi2n1pcfg2fYjFxia
         qeZL1BFnrQZjxqHi6b3trriNkLfMRJptXtS+8rF/urWPm7wtAeyDEuTqyuRKidpSKPl+
         tA8A==
X-Gm-Message-State: AOJu0YxiaJncJ2hf64zHywZ+D4W0wfpa4+Dp/SrUaXBEpay3vilQG0y8
	R4i6M6LwnY+gGVC721mOFrohzL5C681jTgQUNwNfw1zHvoXX5ymX6ilyXpZ1v2gSpjTKLC8tQKG
	0o1iCVQUIK5HPUOVL64xHf3X+WBnan6Ru5FqUHsx4peERP/m4QYpyZG74XH0DHGsH7e+4uTV6J2
	8Acqc0zBivH9JJXMiHgc4JsdPDl5mXo6JsY5htWQSoDOg=
X-Received: by 2002:a05:6a00:9285:b0:6e6:98bf:7b62 with SMTP id d2e1a72fcca58-6f4e02ac4cdmr745597b3a.8.1715289111134;
        Thu, 09 May 2024 14:11:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOeAuLy32ezsJj2r1M7Hca10qZlE0XUfZZcm6MULvRBLOnlB/aFauj8MDw1aUvDiKiKEQTpiYrLQJPHEHvMxs=
X-Received: by 2002:a05:6a00:9285:b0:6e6:98bf:7b62 with SMTP id
 d2e1a72fcca58-6f4e02ac4cdmr745574b3a.8.1715289110746; Thu, 09 May 2024
 14:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240506182331.8076-1-dan@danm.net> <ba0bc464-a06a-4c54-945a-202dca2c4e49@leemhuis.info>
In-Reply-To: <ba0bc464-a06a-4c54-945a-202dca2c4e49@leemhuis.info>
From: David Airlie <airlied@redhat.com>
Date: Fri, 10 May 2024 07:11:39 +1000
Message-ID: <CAMwc25pJqmNwpRvD3-Ahf66_XB9yFMxhSvU=M4vBMdhVSYS3PQ@mail.gmail.com>
Subject: Re: [REGRESSION] v6.9-rc7: nouveau: init failed, no display output
 from kernel; successfully bisected
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: lyude@redhat.com, kherbst@redhat.com, dakr@redhat.com, 
	stable@vger.kernel.org, Dan Moulding <dan@danm.net>, nouveau@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2024 at 8:31=E2=80=AFPM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 06.05.24 20:23, Dan Moulding wrote:
> > After upgrading to rc7 from rc6 on a system with NVIDIA GP104 using
> > the nouveau driver, I get no display output from the kernel (only the
> > output from GRUB shows on the primary display). Nonetheless, I was
> > able to SSH to the system and get the kernel log from dmesg. I found
> > errors from nouveau in it. Grepping it for nouveau gives me this:
> >
> > [    0.367379] nouveau 0000:01:00.0: NVIDIA GP104 (134000a1)
> > [    0.474499] nouveau 0000:01:00.0: bios: version 86.04.50.80.13
> > [    0.474620] nouveau 0000:01:00.0: pmu: firmware unavailable
> > [    0.474977] nouveau 0000:01:00.0: fb: 8192 MiB GDDR5
> > [    0.484371] nouveau 0000:01:00.0: sec2(acr): mbox 00000001 00000000
> > [    0.484377] nouveau 0000:01:00.0: sec2(acr):load: boot failed: -5
> > [    0.484379] nouveau 0000:01:00.0: acr: init failed, -5
> > [    0.484466] nouveau 0000:01:00.0: init failed with -5
> > [    0.484468] nouveau: DRM-master:00000000:00000080: init failed with =
-5
> > [    0.484470] nouveau 0000:01:00.0: DRM-master: Device allocation fail=
ed: -5
> > [    0.485078] nouveau 0000:01:00.0: probe with driver nouveau failed w=
ith error -50
> >
> > I bisected between v6.9-rc6 and v6.9-rc7 and that identified commit
> > 52a6947bf576 ("drm/nouveau/firmware: Fix SG_DEBUG error with
> > nvkm_firmware_ctor()") as the first bad commit.
>
> Lyude, that's a commit of yours.
>
> Given that 6.9 is due a quick question: I assume there is no easy fix
> for this in sight? Or is a quick revert something that might be
> appropriate to prevent this from entering 6.9?

I'll take a look today and see if I can reproduce it and revert it if neede=
d.

Dave.

