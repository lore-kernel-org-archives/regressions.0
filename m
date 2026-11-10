Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794343259;
	b=GmI1jJYiUHXVI4xGt07wxhlfqEk79LHFPdkwmlCHMFEzzWQ5qlSeqpapQz7IBLcBk0u3
	 mN3PMzkS1lUpBJ1pc1NxSX/ijFjOXbf0qwSRy7RmTllUkbhuFVN3+fQeVrLTbeCRZ3ufP
	 PM7CdwB9rpthYu6fMQJKCYeYeVVl+yEnyOwoKqkeRB+0mYVWCUxL3OlpNtGLIGhlV3MN1
	 YP9416DVW/6RNQ2WhI1gc7ZVT93DP8T0iFhvlXKGJDABk166jRzkwByTsvAKmYBax2yEs
	 UIjgL8Tr1hBccNfhxIVA/oxWvrHlQdiRmcgxbWWCysxZaIOBYWcTQw+FBog4xH+cHVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z2r/5TPOj6xlBCwBMvS5lY/uHLFbDokwBpHEPZnfXAg=;
	b=r/Ztys9BU9XW9rLp5Y89sX8c6eVvuXeydB0/G/CaFtHbcjUuiLB/pBot8pdVTLgguFVJ
	 1vJw5zZpKrgeAvRTeVu1ENxDVb5Z05gYdoXCWi9r4q5JEjXDUKPJXQPY8pM1Hw3yM4Caf
	 sAvJqKWx//zWoZiosv8F7gQkyoiyksstsc6pB9l/eC7hDdVUJgTZ821Mpx9RfQIbdgyCc
	 +vtT9eBPXJHheGG8t4bAvfiAEt3SidSiQwOHdpHqBBQbck8Cczz4R2KkFGFlS3VpBgLRD
	 SIfT6k7wCnCSRwadqeT3VGReDr/5luJ2rPV/WIDBxEg6avPlMi83bKNOkmS02ibzi+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qCSsbUL+;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713DC606A332
	for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 20:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 713DC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qCSsbUL+
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3910217eec.0
        for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 12:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794343259; x=1794948059; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2r/5TPOj6xlBCwBMvS5lY/uHLFbDokwBpHEPZnfXAg=;
        b=qCSsbUL+3zXL4iZWQ7E3EKCPndiIhsfrjcMyecfwI+WZOLbc+9EJdpRZOuZgvaEvn2
         TDvEjPy/o0WPVjqu9nGBpwnoJlo4dG4GclOPDO4cMPAlgWgwziuG0WtDK6mxJWvW8gwo
         DkIHu4wDXHhQWz5l2HUrJNPkTBAmg4s84RDnUNPn3Qivwsb2oXCvu62P+lbP7VTi0Xgk
         J+llqiFT3igjtJqxRsBr9RALpNbzj0VXaf1Fbp3nTSIBTltrqcQtVWAuo+fXQegtAGj1
         68NOYclkHotNx3Z6BOJjwHrbOIYEEZ3t8CxJcF8zkns0/AIrLCu+XFPrITcReOb9diYo
         BT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794343259; x=1794948059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z2r/5TPOj6xlBCwBMvS5lY/uHLFbDokwBpHEPZnfXAg=;
        b=TFxYfOXVTIoc5o4ZdsaXyfOKs87YR3eVuzIAg/SkQaGexh57QuwLR1N/Zftlht8/V9
         xTfJ5bG90x7r5r6SLruAoHLaKo78ROXVuPWYoV2vmCCyLwvFHrHnGvJzAwzq5O7cLUWJ
         PxX5OjJ/ds8saT3t0L62kH13gKT2auRIqwiVcPvo163DdUuN5lUALPd9vfDWlzruwcdf
         /lwNuqORrGeUWyZiEh68BZcF7QJGDiF4QgKEj5q9vJPFHSufDPxJna4VrcqCAs1BHYug
         U98SdpGwoLaTrXVyDfd0cmYNSUnNdIic6CT3u171ksxuv36GHsFNQy48zAH+XUOIXFuu
         sTyQ==
X-Forwarded-Encrypted: i=1; AL+hErHgqRiRgbCeJz3vnF6qEPE+7oNlW7kiV7CyRM/fVHomgp+iPYljj/RZfVe3baLH60oldfI12Duj+oCFeA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/bnWIlRWSUEo7S5SMRxIhfizLyGpr4cHrOLPVeZ4b94OPQeHaU
	vN557P4EPw0bVC9Wf6cWmqkC5Zx29OZQMiVgudkEuepvqEeY3WEhj9fd
X-Gm-Gg: AYBFou1JeR50RX2yYxL4gR09+7HsK+asfd8ZruJnJUyLFNUzol+w2Zt9kjsCJTsv8Ln
	XwQkLeOq2TQ/2aj9hob/D/GuhOcePNEaQ/4Bvr/lrQ3a130ryDAwueOjxQJC+1MMXiaeB6+Smn8
	AT3eLMecHOI3NNEW0B9GHrD/VXJefQ9KXOgogFkzM5ZCFp/lFwDl0ruq3q736hXBxuARrqR61j5
	gYg03CJamdHAZ8UJlWmuCqF+ek7Z+YvSyUC7oyrHOeEfbGIIHtVfZnrEWtrcYchXsIOgqGwqF2h
	IjKvD6ICKwA1wU1FUCpchOGNOvX7vTqbfL20lUZR20NJ5h3YaeiSnMS1GO3BNEca36Y6t01T/ND
	HIqBz1BdfXNcntrKS4uLusx7aWeryUhQnEAnal0pugak5QydcK8JMvBgU5pVjIUnNHYFvjrPrNh
	lOUy9PNSHWW0XhoPEGngwcq02sQrKJvY1ZTec4enzrlZhzEFzikSoLhq0isABVZhSFbrn6cZW21
	L5O3Y8J2eCCZ5/rIA5y0n+HGSfuzSZ7Wi25rybZo4WiB+ESm8HGfhlMJt4QZXCKtLYcne6tEyX5
	+/AKhENfmj76spwmo8xaeKQQ4UrriMtm9TKNYQyTDeHO9d7qM6Vj7DkqwDJNjxpVEA==
X-Received: by 2002:a05:693c:600a:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-37686d3278amr499900eec.33.1794343258427;
        Tue, 10 Nov 2026 12:40:58 -0800 (PST)
Received: from LAPTOP-KD1TH5BD.tail375eb4.ts.net ([47.11.98.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bfb58dsm17473286eec.18.2026.11.10.12.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:40:57 -0800 (PST)
From: Gopal Malaviya <gopalmalaviya53@gmail.com>
To: akpm@linux-foundation.org,
	willy@infradead.org,
	jack@suse.cz
Cc: linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	fujunjie1@qq.com,
	vishal.moola@gmail.com,
	roman.gushchin@linux.dev,
	tracekotae@gmail.com,
	sashiko-bot@kernel.org
Subject: Re: [PATCH] mm/filemap: restart mmap readahead on sequential faults after many misses
Date: Tue, 10 Nov 2026 20:40:35 +0000
Message-ID: <20261110204035.184968-1-gopalmalaviya53@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-206717@kernel.org>
References: <20261109091444.128521-1-gopalmalaviya53@gmail.com> <sashiko-outbox-206717@kernel.org>
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

On Tue, Nov 10, 2026 at 09:15:49AM +0000, sashiko-bot@kernel.org wrote:
> - [Medium] mm/filemap: do_sync_mmap_readahead() recovery fails when
>   min_order > 0
> - [Medium] mm/filemap: do_sync_mmap_readahead() ignores VM_RAND_READ and
>   !ra_pages
> - [Low] mm/filemap: prev_pos == -1 wraps to match pgoff 0 on 32-bit in
>   mmap ra

Thanks, all three are right. On XFS with 16 KiB blocks the reproducer
still takes 4096 major faults with this patch, and on a MADV_HUGEPAGE
mapping with MADV_RANDOM it starts readahead anyway. I am testing a v2
that handles both and the 32-bit case, and will send it once the tests
are done.

The page_cache_ra_order() underflow is pre-existing; I will look at it
separately.
