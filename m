Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943E24F5E6
	for <regressions@lists.linux.dev>; Fri, 29 Mar 2024 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711723016; cv=none; b=F7uJM+BRaJzV00jWDAsU4wp2M6qZObp0kG+svIeOdDm6zzpmJbWHzBb1CjTC+Ci7Gt9Ek7bC4pQtlVo9lP2Fzx00TgRRWAY9knKlmA6bzww2jYuG2ilqV4sBNB+COB8C2/XFndLH8NtK+QImotSGBknPSTuDQR7CPYKzHzpeS4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711723016; c=relaxed/simple;
	bh=bPvMNR7MbmnvRzmrCeFpHuyhDQ8Ru5g+65WvijZ7CRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EaEb4/ObDz/nzh8tuco7NjEmk2/2mniC8hNhGf0H1rtfwazsCV21UqkEtYCPnFTOwoccppWSk6gkcXKvUhtXCM7YDleHVuNQjJplzyijSyGpAIzSVb5GQj3xWfCVVbNWe2R1r6UblbHvIFtmOpRZBSLxk2PbkPlg9yE8Hv9CHpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cg60A4l/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cg60A4l/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DBDAC43390
	for <regressions@lists.linux.dev>; Fri, 29 Mar 2024 14:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711723016;
	bh=bPvMNR7MbmnvRzmrCeFpHuyhDQ8Ru5g+65WvijZ7CRY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Cg60A4l/pBDcXDsBPD0RJyhbe72b62jmIyyImJWz9dnt6j07XFudf03kWvHirABhy
	 yY7N06LI6ni+1ov2Yv/PdX25viaee2D+jAv6eSNrBSBL+HjfXGx+yz6cZ14jYR7sn7
	 ywQm6JUm6En2Ctf68alf+McMLKF8Kre4FCqGHJNioZiOvaoSN0XPKg3I7iZgMTyAaZ
	 Mv9ty5vPPi/2B+u6QedI2FZ84S37x3ERRBhK0X1zAD48AnPQCgJs6d4hQT7mhLTwdk
	 JmDmayfILHtPLJwem0RqOnv78NEXpkdmE+QVlOta0p0i9SJfRhbqhYaI5B5qho02Sc
	 H80XGdtTi8zdw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-515a81928faso2427159e87.1
        for <regressions@lists.linux.dev>; Fri, 29 Mar 2024 07:36:56 -0700 (PDT)
X-Gm-Message-State: AOJu0YyDlUjxmjisi5jx1rbJMzLEN3oVqr0uYr5pBd/sjUZK5t5z67dC
	B+th0o3nC5FbUr50wGD4W5/Id61ue2Hq+f0ln5mzEkR6h1ZiNo2xZmtgYSWINbmoHHdUfKOYD0h
	LAq6oq1jV1RfJwiHpN5FOOiITYZk=
X-Google-Smtp-Source: AGHT+IGmzjYqwJVJ6BHhkhSSbXixb/5G5AEc5KD8ztiu+Kfa1bTnd/8z5/UwyPUj8twpE4WpeupR5TzwQLPSnbpfzLE=
X-Received: by 2002:a05:6512:2813:b0:515:d1f9:983e with SMTP id
 cf19-20020a056512281300b00515d1f9983emr1239535lfb.12.1711723014416; Fri, 29
 Mar 2024 07:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a99a831a-8ad5-4cb0-bff9-be637311f771@podgorny.cz>
 <CAMj1kXG1Vgpp+ckwDww_4q2SF+kajUaoE3+qe5FzMkGyq-Lbag@mail.gmail.com>
 <CAMj1kXGZLs3MdFiK9jrkmWR+YPt50L5tuCJ+rLLTjVa3Grm6tw@mail.gmail.com>
 <61148405-2036-4994-9eef-45cbe6aa9adb@podgorny.cz> <CAMj1kXHn0qp2Qq1WfoT015ezjnzHLoy7=XVE_RY+6jsHzQ+gkA@mail.gmail.com>
 <35ae3208-a0ba-43a7-ac4c-6f770b3df405@podgorny.cz> <CAMj1kXHO_R4XpQ=To1ZW_yac_sjWFPnw7pjunn0UmraFDA2wCg@mail.gmail.com>
 <92898285-e85c-4e72-a179-70fb65349978@podgorny.cz> <CAMj1kXEfeC=O2_NFteJM+L1PqgR2MiXQEcFzmeemsgdKC8s7xQ@mail.gmail.com>
 <dd6e61ac-2356-4b97-85b4-b963a045361b@podgorny.cz> <CAMj1kXGcsEhf24QO1_4Wf99z=PR1cqdxim0Ttj-TqQijZOW=+Q@mail.gmail.com>
 <5e9b5508-cbec-4b81-a2e4-4a02e7c201dc@podgorny.cz> <CAMj1kXF5TUNXVxcaY550_3JYvkGUZDRYtmPAKpbk64Ci8gpbqw@mail.gmail.com>
 <ae488ff7-97f8-4210-a1a7-98f7a5c3ffa7@podgorny.cz> <CAMj1kXEarH+vdk3SqJ8_Vcf-uF4FjTfmjepVbXQ6KciBuCK-wg@mail.gmail.com>
 <CAMj1kXESfih-V4ObfoyROyABoYNp6e9gwGH236=PfJA_AWhQsQ@mail.gmail.com> <240d9025-243f-49d7-bc81-88deceefe12e@podgorny.cz>
In-Reply-To: <240d9025-243f-49d7-bc81-88deceefe12e@podgorny.cz>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 29 Mar 2024 16:36:42 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE9GDfQKr=VV9USSKOV4s8pXMz_4trVnbkC0GM6grhJOA@mail.gmail.com>
Message-ID: <CAMj1kXE9GDfQKr=VV9USSKOV4s8pXMz_4trVnbkC0GM6grhJOA@mail.gmail.com>
Subject: Re: [REGRESSION] linux 6.6.18 and later fails to boot with "initramfs
 unpacking failed: invalid magic at start of compressed archive"
To: Radek Podgorny <radek@podgorny.cz>
Cc: regressions@lists.linux.dev, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Mar 2024 at 12:43, Radek Podgorny <radek@podgorny.cz> wrote:
>
> hello,
>
> this patch (i named it 112) WORKS. no initramfs error, normal boot sequence.
>

I'll take that as a tested-by, thanks

I'll send this fix out to Linus today, so it should hit v6.9-rc2 and
make its way back through the stable releases in the following weeks.
