Received: from mail-pz2-f16.google.com (mail-pz2-f16.google.com [74.125.228.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E5B47127C
	for <regressions@lists.linux.dev>; Mon, 21 Sep 2026 10:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986171; cv=pass; b=p9oyFXnjTnjtGOcDV70E15cEAWfAn++NZLR1OCYgvZYHhyCZ+PVX4y6Ar7oz8/DT2y6xZdreIArgU84PB6CGH/rzBZ3ntcR1CojPxUh7wQHcKxb7LMBv/6u6H+aZnJv+wYKPCltXLhp5oBr2fs/wWzv5CxuM8BNy25fbJ1ieEl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986171; c=relaxed/simple;
	bh=jxiUfSa+budlgOb4deQ6ne2o5T4IBUsXkRWChU/Uls0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=unWTaAJYv/1v8PGxQzKNWxWBTyCk5I3+bwEYqiAS2SiEG30HSKPdgWr8wfFE9EljNrIDon5BUcqwuW1GzwNkQOsq5Z94DUD6P8x0COv8WOCgQ06yfSRa2v/NkuGss5QbVc2AI6+60bGYGFrtOT8lGlh0oZ2rH8yz/W0lde3U9jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h27ftKRh; arc=pass smtp.client-ip=74.125.228.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h27ftKRh"
Received: by mail-pz2-f16.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so1663177a12.2
        for <regressions@lists.linux.dev>; Mon, 21 Sep 2026 03:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789986169; cv=none;
        d=google.com; s=arc-20260327;
        b=NtXlSLcZud0lpaeCm0u8U6CthvnyYU63yJD2PIxEww11tEDRm1echz2WvWErTvMNy9
         UPzWlSH1FdEGcH/pWORmzFKSaLIM0GDB+xgmXIqm/mBhdSwz3tjH9cNniuYJbitGCZrR
         YoqVklA9diRWAovJWYeXKcqmU4TKoxIA4aQG+w304SB/I0crmnuZjpf6i3VcPVthTl5N
         7rKgDzFvnx4cdYciMAa71pm9CZmsOgKJJ3Pr6tijUOxvg0vy51U7TEfZoQgodi2Uhjpi
         zL1x5UoZBcc/ydy49rSw4JIfDZEhIPCpM+NNLAJDYPxrftV7rED/2WLUQyAhxTO5lK6d
         gd8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jxiUfSa+budlgOb4deQ6ne2o5T4IBUsXkRWChU/Uls0=;
        fh=/CzogcPnduYUAbv/JfrnXdqQZk8QI1Ty1MfoCl35mwg=;
        b=A5doRIhv9/0oPLA0saj5tR7BWbPScCAzcAHh9Ng8fkY0B18z8+uVQPoPBqxQ+RIY6c
         cHuQxnqrJ4lTGC7K57kZVTj/fDuBAxpH9vshEh3sVL5/epvw/vrVs/NhfC9KPyLZPOZv
         hXypwzQH8QZyKp861FE1p3x8W81eEyiUVV4HW6yh0vEJlb6OqUVAgHjbAKtOeIeV6bTC
         5SgUQ/wRrzQzSZOISgHbG3RTOsSdOuWOdThlZoN98Ji1MVA7d3fNu6/CnnTy22+4Anzw
         eyFtyPOE0N4eAToLl1W99YfND1qCmmsp1VqYIbTNPVxcGF6e5xcufNBNKMKCU3Sjcp+L
         7MhA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986169; x=1790590969; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jxiUfSa+budlgOb4deQ6ne2o5T4IBUsXkRWChU/Uls0=;
        b=h27ftKRhgtaxXd+qJ+is7r6AJG96xLJTMmAt2JhLMrun4mHfxUmnA1EctOrodp74vG
         Q7Mc4/LRUaatERdfBazWHmu5T7dmr9D/AnO4uU/alssPYdZY3Bo7l2pNMeVUeBmwDGGV
         sNFtDdviJjZfIFv8l3OHJNbFZ4RosajZnI3lE3Nwgbz9xSgvnCiHll7JgqMb8WlgOGHj
         zixwz7Dt0mI7WPJaBGlaSZAr/nU1l4ju5Twk5IJMGdOfsUcUNryQcZUG/DyaDuyPZMDC
         soFkncN6+ivKHfKzXSEopJUXH+0JCIicUw+anihdKC3KJBHEbhrxm1K/Ct1ZxB7xPcTo
         L9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986169; x=1790590969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxiUfSa+budlgOb4deQ6ne2o5T4IBUsXkRWChU/Uls0=;
        b=LqkMIu4A+KnkC30HZyXlHdxQ1jeA5I7wc3AJLsZPfP8NV83xd4aDooLc1W1MbrGuu1
         emowa7tbBTfFJqLvnnUjYk2f52c/9fsZYOafol06FkDuU9WFwuxqnqALhIuPn3dWC4Nn
         yITLn1fnFIpGxGsjMPpd4TF+KoEvKw6p1lyrH2pOLhg6crdklZJjn8pF8NEgS4i8t0uf
         ZQsnSkG+9ZuRCFU8GEorVry580Y4bZ5VFBaatQ61fIYW+0+SMrweuBvQQJAabcxJqZsI
         2B0c4SODu1odpxja68d2U/L45wuhHoYHylKA7vW9LeHGW9+VZzRRRLV+Rl3R9Nn1HFw3
         z36g==
X-Forwarded-Encrypted: i=1; AKwUvBzYti3Lw7YjBDcu+Qc6UmouWF2xv7KZX8xVeUkDmuydKXztrhW/jnoRng5zSu77lLVCGXCNucuR5P8JAg==@lists.linux.dev
X-Gm-Message-State: AFuF++m0YyvAN8J3IecQ6XJ9zDYid5iTae6KQa+gfV9/xdqWzu1okHks
	EKB0sFm1XIyVhOLdnJSzUtNk+6Q+z1fOmdbgv61+GomLpZJ65W6Jh/ujJFdmDdX1fFKYoycRfmo
	CLf9Ngn0vtiyRsbzEJ4AfiqtDqK+OveU=
X-Gm-Gg: AYBFou3RV5cgnbgcSMNTLOkHHNBW0B4SF2w1Nx+K6CyV8GYuKGv9qYNOi9smw2TYYuJ
	Xw4zKWiOZSTDSLO11A7psCLjbWphptDy7sWczgcWRcKdnK1AomFKZPYVw+bGCeISlu3Q7SwrZsG
	PYTyhxYodWbC9vP20hqSwyeiCRxGZTZHIt4e4V4/LPZI4gI4QA57K6dZKXf3M7WLJlh+kNc2Sgv
	JE5qCQFp9tR5i+ABXsJRWopXdphwa88NtUoh+qx/zOTZgD0d+3TosmRn9f9RUWV8KFNCrFOXeWF
	phwqZL8xoc43DXGA3QnM7lCMT3zhA2gCTpNLwhAEn/6Ov5FsKo4ocTqjw/JWf69DoZpEtotoLHY
	64xz27chIgH1yCDuoGmMt4VoKi92C7YofN5IqlBwO9+Ih3kHYDSm3/1tJzZ6nbtaqoTXf1Cg7TA
	==
X-Received: by 2002:a05:6a20:728e:b0:3dd:85aa:4525 with SMTP id
 adf61e73a8af0-3dd8c4f0d4fmr17653691637.32.1789986169161; Mon, 21 Sep 2026
 03:22:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CALjEBWQo0-Sdimo+aRNKUQvgDGw=jBFCcfwCXaqVdtoPrHLAQA@mail.gmail.com>
 <2026-09-20-daily-reply-0011-re-hibernate-preallocate-deadlock@kernel.org> <a40f9988-7e82-42f0-a27d-7a7c94dc37d7@leemhuis.info>
In-Reply-To: <a40f9988-7e82-42f0-a27d-7a7c94dc37d7@leemhuis.info>
From: David Lomas <david.s.lomas@gmail.com>
Date: Mon, 21 Sep 2026 11:22:11 +0100
X-Gm-Features: AcwNN1VGK9eJqWQOMs5ndg88mO9M-KWXOKX7uR7KJ_FGuaACwylQwUWYMMOnr8M
Message-ID: <CALjEBWQrDh5KrEscjVutk_H3a0+jH-=DOa=au32z3aZq20fxug@mail.gmail.com>
Subject: Re: [PATCH 6.18 0167/1250] PM: hibernate: call preallocate_image()
 after freeze prepare
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org, rafael.j.wysocki@intel.com, 
	gregkh@linuxfoundation.org, matthew.leach@collabora.com, superm1@kernel.org, 
	linux-pm@vger.kernel.org, regressions@lists.linux.dev, 
	Florian Schmaus <flo@geekplace.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> David, you might want to take a closer look or even try that patch.

I'm building 7.2.6 with that patch, and will run it for a few days;
obviously hard to prove a negative, but usually on 7.2 after 2=E2=80=933 da=
ys
of continuous use, a hibernate would hang.

I had one more hang yesterday, captured with SysRq: the same deadlock,
systemd-sleep in throttle_direct_reclaim() under
preallocate_image_memory(), waiting on the frozen kswapd. That one was
with vm.watermark_boost_factor=3D0.
