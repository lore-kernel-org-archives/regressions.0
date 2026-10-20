Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496400;
	b=HC5EEiB3+PLQyZeqZ6MdAdoiiMkgyTB8wNFRwWTapob+sfWSKds8fKmY/ep6c4yM2OfQ
	 E5lETVdUZU7m6G75NpN15882h3Nn89gdAbl6YCPl0DWOghEoR/WEzwMNdgDucgzZFQhlU
	 zGB8EGSeObBrclZkh64o1Jwpcp7IHCBM9RZg/uu0yWfXj83SgqLIsdtWbuSqp8rOk77Vu
	 YEIxU7NGA01PJxk/y2y03hzpI0tzzC48sG/fnvbi51Qx17xaOHgjDIZKIE5llm89DnKZ6
	 jjcvHJKzybhX5wcys2ih5Bbvbk/pIQbqx9FT2l37Z5J3TNrUhUn1Xc+QPZ31ly+bLYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oW3CDQ8hWTvJxUFgrwX87dctU/0QppQ3eb5Z2AmQA5E=;
	b=RP9JWVqydeJfQyvfQdsQXcOgmycG2g+ZfiaYLTzG0V5Qw+UklFTF89SkyFFFwSfCm1xf
	 e69rJbA4DLIOYXkMMER4c5YJH+uHZYfxCnfmExgmkmra6alJZiiCl/d2Fhgr6Rzf+kxQp
	 tuRUTJ3Ed3Zib/Yt1GP0OEbd5oIkQfZ6V+Z2geGpqmnQvNrO8G1NI0N8Nobjz61vbEDsd
	 u43BADuSImP803q5ZDt4NlPAMc/cTg7EzlTkCK9QcQ38wFfeidpWg5b5muR40Ys8nr5ex
	 W1N4A7quEzY6fpXvvItUWa7TaLtntGVqWim6RSESL5VmyYooxZaXqP4yyYQjrCvqJzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HP4BI4ZA;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F5D606A31F
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 11:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90F5D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HP4BI4ZA
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so6866815e9.0
        for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 04:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792496399; x=1793101199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oW3CDQ8hWTvJxUFgrwX87dctU/0QppQ3eb5Z2AmQA5E=;
        b=HP4BI4ZAdHtujzwM9voDyl60lSQj3U8qbS4z52mmqADhW4/7hBgy89gwewejFMQYu9
         eDp2qN8/uM7O4VMOxIuKiyQkrkFb9dueK/kfMqQN4wSmBBeRglKBUjPg2SP0wggEp9sw
         n8iVuKiFgQQPKMgVYRBhbLLjnAi7C14cwHDaxghbFe+7TKofGmCzRWrm1olQhltb/Vn+
         HyDeuogL/z6Ymju7zbTXSnV+f8MaGlqDHPLy/FvsR43P/VayZAMns8B7ay+kGDw9GCh8
         4oGjuJ3YX1D+q3TJJideqg6OpMcGwrhfi1RBE4LuVerxco+R2igJhLNPNXE0rN2cp9rJ
         PcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496399; x=1793101199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oW3CDQ8hWTvJxUFgrwX87dctU/0QppQ3eb5Z2AmQA5E=;
        b=JX3BBIdkyugEbSmdf3LL/r7pA2Qqbk1C2qJi57uRysOebHIvzbeQX9oaiib8xJDgl7
         l0HWH/bw6j8SeVy69bEUS/QOlFN6Ze3QWg8Xuwq5yzQwEt/wq2+nIDrBD9OD4aXUYhqu
         MwbHIGXcvUbV5bSTAy5Y2kMrIlY10po1lPQwwnB+3WG6ha5DXD0ngtprevlv3jwIN18x
         8fYUjapemEtdQNtqY4Le3WktAM8VHEdUNXg7hvaqCDCX9ihcof1pGGXUkniCJ4DKa0Uk
         y7Nv66fZQqzOO5fEFpotdIPgd6LKk0EmglsZRy0slJNKPDysdeLsrI4DVuu+A0JxOsBU
         QXTw==
X-Forwarded-Encrypted: i=1; AKwUvBxR3CnNiHsTez7maUtEL10ENfsKKZNuafPEBmKjXYT/1w8TU+Z7DHCr/pSyYaPpDxaqdjVqJ9c24mN0Ig==@lists.linux.dev
X-Gm-Message-State: AFq9FYLTLGptyFDbWeSu+kFBIv4k4AHPXreZzIqUpndT6Q2MLPwNWReE
	GFIKrWNvJuj1E2TMrHXAilHnL+Br9sirdO4KTYBc0iNCmaFyfTfwxDsU
X-Gm-Gg: AYBFou3j4iBoZWwSOXziAQdgvMn9jyxAF3ADRDVdE8BJUOqYXOArIKG3am1YPOM7adj
	5LHhcKWBCnLvWQltJzDGa+Insoc9dN9A2JRErsjsyvnvvgWcbywifQS/LrjnT18gY8k4rXP2xbB
	y1NlVnFZCKZVIX0RghuQrYfVoDphy83vIfNW245dJ8tw5KcZqUt09qKaZMSTlDupUN8iBKX9+iN
	jP26lUzPOt9bXb9XnjfuJqLw9XtzHxp4gJ8inF5//+0M5uQyGivaD7CME04RCZjA24kkFD8LTj6
	YbGBDJ5qTaTL3/nlaMqqM+Rb/WqnWZDrWtzUkVUhKTPU/y7xh6wMnPuVmKYKiyBBIAP02SoLHnS
	DqpuV/mHSDwUl+llw41hBrp9YYrhrhwcXp3L1SXbE1jV95i3YoV7Doeitn5fJaELy7T3UNAxu2W
	6FAc8KHENlaNcSgY9gZr9C1hnI8Zar0PBD+NjZe+tz3mfucn0cKToihYoKgujxEfrxnw==
X-Received: by 2002:a05:600c:4e04:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a1f4c7f3c6mr41266915e9.5.1792496398642;
        Tue, 20 Oct 2026 04:39:58 -0700 (PDT)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2c242dcsm62439595e9.0.2026.10.20.04.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:39:58 -0700 (PDT)
From: Andrey Misiurov <andrey.misyrov@gmail.com>
To: Alexander Antonakakis <alexis@maich.gr>
Cc: stable@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-scsi@vger.kernel.org,
	gregkh@linuxfoundation.org,
	sashal@kernel.org,
	1151377@bugs.debian.org
Subject: Re: [REGRESSION] 6.1.178+: lpfc: boot hang due to use-after-free of mboxq in lpfc_sli4_driver_resource_setup() backport
Date: Tue, 20 Oct 2026 13:39:57 +0200
Message-ID: <20261020113957.951380-1-andrey.misyrov@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <29f6c901-5209-4681-81cc-ff768cd405f4@maich.gr>
References: <29f6c901-5209-4681-81cc-ff768cd405f4@maich.gr>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Oct 20, 2026 at 01:23:03PM +0300, Alexander Antonakakis wrote:
> Moving the mempool_free() at line 8178 to after the
> lpfc_get_sli4_parameters() call and its error handling, as in
> mainline, should fix it.

Hi Alexander,

This looks like the same issue I came across. A patch doing exactly
that is already queued for the next 6.1.y release:

https://lore.kernel.org/r/20261008184328.2857037-1-andrey.misyrov@gmail.com

Regards,
Andrey
