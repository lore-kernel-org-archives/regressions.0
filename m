Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9BA330652
	for <regressions@lists.linux.dev>; Wed,  3 Jun 2026 14:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497311; cv=none; b=fnNYTvv98kSnvzmuaYDiwXhaGBy/aor3LNKUIhjlUOkQYddO072+fmHHps0xM7R42nTicfdRxzK//Z5JP7jYXazdew2G2O0Q8wPRln6H6FIFfYSKynCNFfQZuVnvjPuBJlYOy13lZ2k0mnIBPdnUYljtpunBtQqUYMDBXTuFtjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497311; c=relaxed/simple;
	bh=zSYh7SK16REeywlliZ2DlArXTX5ucvOzjVrB2LpqcIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=udUw6cBHEwc4NnCe75GyUHlQth2bOnnZ1nrDtNjMFZkHhHsrRfMDScEEYNfaEGmegPPPpX1iSixIdPZH/t47Vl4GbSAkOVy7aX/pJ3K1yWHs8aaeSGdhSApNJ4aoSLVc1GabcTBmu/DVc9JpPKx5Ur1y+JOMHmWJCtLJ5AFMq1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNVML1br; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNVML1br"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301D61F0089A
	for <regressions@lists.linux.dev>; Wed,  3 Jun 2026 14:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780497309;
	bh=zSYh7SK16REeywlliZ2DlArXTX5ucvOzjVrB2LpqcIk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZNVML1brSH5Q9gecCk+hY7s7DQihZyfGRn+SkLsqc+JEad5GxEqjzt2Zip5QigUQb
	 5kW3AYaVsGKC0CZNzB7Dk+eu1G2DzNFWDH/HkbSvwY3lz970eD2aAHXIRt40PReVgu
	 YKTVduWu6hTZWEPEeAHBbzktd9NJlFUoaPhQYQc7DCB5w9rNPlP/nr1g5bRA4iL4R8
	 EhzyXZ15M9uCUQVriGnwVUCRUVDUfyZPMJen4S+uP7Q4VlSq+BDtmg2bhm2NvHUFHI
	 szxQFaYuY4qTJCdvAw7CuOUm0h5e5Drn9ZXZppWaQF3VQB9CCIKMCpcSESWiVU8d6D
	 AX3ozrkhdUiHw==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bec4639953dso707214466b.1
        for <regressions@lists.linux.dev>; Wed, 03 Jun 2026 07:35:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+V4CsfHK/H4vXTtQvhNyslQ/Fb0R2qs1flX+nKaCsYKfI6+RHOYVhLy47jgT/FEPxV1vJLwxkxs2ZZrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyklUaiTwsbhQgcad6Swv9nFlVnZZc+F8dJ4NMOsfcouDuvL+X
	kuybSzdyvmiS8VsYkCO3NTgCFhFEnEFdOw4uNwqz2T9PJ+OedRNABgxBP5NUy71MfVWFVpBayK9
	eQQ6k61nuf+6t2fVPFoWeAFjnw+IFWG0=
X-Received: by 2002:a17:907:3fa0:b0:beb:2665:f37c with SMTP id
 a640c23a62f3a-bf0b4392021mr210636166b.46.1780497307855; Wed, 03 Jun 2026
 07:35:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKYAXd80+UfzKaCR9YRK8dAQq9S+kEp_VVwr_p3dj1tEeyqUQA@mail.gmail.com>
 <20260603131950.321858-1-japo@linux.ibm.com>
In-Reply-To: <20260603131950.321858-1-japo@linux.ibm.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 3 Jun 2026 23:34:55 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-mLHaF6VeREroNfUXYYhqLObr=8Lmv9JqVZ7qu5XO0Dw@mail.gmail.com>
X-Gm-Features: AVHnY4K413_sgqXiq4PvJ-_KMlJ75A4rKrG1UjnZIbKBxqxxwtZ4UkMxOjnynoE
Message-ID: <CAKYAXd-mLHaF6VeREroNfUXYYhqLObr=8Lmv9JqVZ7qu5XO0Dw@mail.gmail.com>
Subject: Re: [PATCH] exfat: add swap_activate support
To: Jan Polensky <japo@linux.ibm.com>
Cc: djwong@kernel.org, hch@lst.de, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	sj1557.seo@samsung.com, yuezhang.mo@sony.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 10:20=E2=80=AFPM Jan Polensky <japo@linux.ibm.com> w=
rote:
>
> Commit 614f71ca1bdf ("exfat: add iomap buffered I/O support")
> converted exfat buffered I/O to iomap, but did not add a
> .swap_activate handler to the address_space_operations.
>
> swapon(2) on an exfat swapfile then fails with EINVAL, which causes
> LTP swap tests to fail.
>
> Add exfat_iomap_swap_activate() and hook it into exfat_aops so exfat
> uses iomap_swapfile_activate() for swapfile activation.
>
> Fixes: 614f71ca1bdf ("exfat: add iomap buffered I/O support")
> Closes: https://lore.kernel.org/all/20260603110212.3020276-1-japo@linux.i=
bm.com/
> Signed-off-by: Jan Polensky <japo@linux.ibm.com>
Applied it to #dev.
Thanks!
