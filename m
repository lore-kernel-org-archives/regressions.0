Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AFB1AD5E5
	for <regressions@lists.linux.dev>; Wed, 21 Aug 2024 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724247802; cv=none; b=RIile2PeMbvXptGuCSjYt0zmXPFwTe2moJOyjjjprdJZvqKlnvdSVCC28L3WvTZ53vRlzYBG/Vy7g4/TfSJhaV4VXlZINKbK9e3I67FK8A2wiGNGu7PAasq3/boSq1gWlomfLu3GTVm+qg9t/3e4BMlEfJ6camiGFsZGdbM2rCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724247802; c=relaxed/simple;
	bh=c93I54raOSbs0VRQIoGu5KAoP5RS/AuhuCp4Xi1YKXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0Rfv6FgCIXQYJ+re9MBW3cwHIoPiyNB/NvJjrjqVQOF/NIebB5zDYD/lDahD8xZNwQjtovhsI39eLZekvlzgdJEZq/SiPBpsjYp8sTK5SBK5p6c4WCqAt2gRxCbVNTYWEuX0s28uJyebsBFDQGy0SVNvp7JDynmtyVtW1Qm+KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wrPAicw8; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wrPAicw8"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f3f163e379so26185321fa.3
        for <regressions@lists.linux.dev>; Wed, 21 Aug 2024 06:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724247799; x=1724852599; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vq7tOAAcz6ewTIYXkiPmAfOTq4iDQRtjoPIe2wulO0E=;
        b=wrPAicw8IF8YIAUWaKKIqyzP/HqSbNHZYivbZe0PgLBmGuFvp0mMdvPPINBYgnaNWo
         njohxAEWMwVvxDm9RACktc2lKFdC4fAEbDmELeDWZ4iZSW4mP+dHk3rSlS3diwFzv1D5
         ahPhjjl/VZdVmrIBNfPUYWEUoidhlMF0JGGy7nJJHWDNQ+slG5aRPswjpqNKnWEO/wcK
         aOIIu/TgQjipfgPjclqQSoQk16SOZDmx4hXD3yAz0qOtQY4jboYb9Ey2guoAaoSsZs8G
         4+c426DW87KkDEl3wqfGl37kUNAuVe1jRcHR3A5H2wDwvobMo2Xl1etCmuMPc0eZ21LQ
         uByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724247799; x=1724852599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vq7tOAAcz6ewTIYXkiPmAfOTq4iDQRtjoPIe2wulO0E=;
        b=nuU0pScy2djiGIo47s1k1xDb+gxE/ODbkGs5pg/KpyL9Q52pawDGHAXgaYjSI4aEFK
         m+068OVD+HRBaCKXlQ+1cxKczr71kM70qz9HuXusSpWDX6TnmYHNtybkaN3lGmmWfxFt
         gxxF2Wce7zLodPeULlLxKreTnZerDe1n5DlHlnFGDl8v0jv0dfhIz5v2QxIggM74Sytq
         kWO5dAmT0Ry5oAk03GymY0dzryogJ67zZl+NBvKl6XveangfMapx/GGP3b7ectc6AfZR
         SCOx7RDX1cxfe2ZFzCTKMHQh31mIYkzroYDz5aeK7b1c4JTVjxigPlPJ6m4aNUgHK2tp
         iOfA==
X-Forwarded-Encrypted: i=1; AJvYcCWdRVN9n6s/SeNSACTtj4CGnjUIsfPaKYrmnbs3lVObuaZY3QfkAd7/UlYalVoCh8yP5NFhy+ohOpIxZw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTk+zBgi1IRICO/YfItcvtsJeLHZxFG3T7bje7JS5dwiTiuJfV
	0nqCMf/suBqb9IWuZBbiFG5Wyy9xF+q+gA3SFwiPzUe2UxZ/vy9tWj80k5LLFQ0=
X-Google-Smtp-Source: AGHT+IHQbdHH8LzMKMml3FZkZHmsIF0qxWUa69l3XY4StmtQ7T+OKiiLyZ1IaFB9tC0TLHlDr4Jl1Q==
X-Received: by 2002:a2e:b8cb:0:b0:2ef:1b1b:7f42 with SMTP id 38308e7fff4ca-2f3f89489a5mr23557941fa.36.1724247799207;
        Wed, 21 Aug 2024 06:43:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbe7f17bsm8234877a12.59.2024.08.21.06.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 06:43:18 -0700 (PDT)
Date: Wed, 21 Aug 2024 16:43:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Matthew Brost <matthew.brost@intel.com>, Tejun Heo <tj@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	linux-block <linux-block@vger.kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christian Brauner <brauner@kernel.org>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
	Lai Jiangshan <jiangshanlai@gmail.com>
Subject: Re: next: x86_64: ahci 0000:00:1f.2: probe with driver ahci failed
 with error -12
Message-ID: <af7dea7d-446c-4b25-a1e9-bd1f3753f589@stanley.mountain>
References: <CA+G9fYuD4-qKAX9nDS-3cy+HwGbyJ6WoD7bZ_QL0J__A++P9aA@mail.gmail.com>
 <CA+G9fYuYfNA7NZDHpq2K24CsUn21LAb8vn38=JTz=54bsdSd9g@mail.gmail.com>
 <43be498f-5a25-4ee2-8c5d-1ef75c4d1ff3@stanley.mountain>
 <eb78af03-b407-49d9-b605-af9632eda08e@stanley.mountain>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb78af03-b407-49d9-b605-af9632eda08e@stanley.mountain>

On Wed, Aug 21, 2024 at 02:54:28PM +0300, Dan Carpenter wrote:
> Give this patch a shot and I'll resend if it fixes the bug.
> 
> Fixes: b188c57af2b5 ("workqueue: Split alloc_workqueue into internal function and lockdep init")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Actually never mind.  Matthew sent this same patch today so this bug is fixed
on today's linux-next.

regards,
dan carpenter

