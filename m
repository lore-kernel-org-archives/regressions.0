Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B29A18E757
	for <regressions@lists.linux.dev>; Wed, 21 Aug 2024 11:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724241276; cv=none; b=p/b7rY6c3zIVUPUsusUfslGoz1UlDg/aMPhpUROeimtlXg/+cT42/oZsxZ7Y7toQveb0j1QlglU2gryZx1FIR733mv/PKSwCnDldP0QP3B+MHOssnQqIo2CmbCK6we2Gf1pxSRvFhyqR8GRlulAwHuFmzKIvzCbnz2ctTcY0LoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724241276; c=relaxed/simple;
	bh=WSFE00FeDtnofDWlCWa6o9enLw2V0Q9YYDGI3XrXwx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pF0afKVE0R87OTS+Z7WqJyCBDK9I2VTL9pnwTBH4+bwb9OwSt535c8LQJOdzX1FWkQCbdqeCnjWiK+kpvHxMcnbFoiBRyHmLWG8KJUM5mVVWlzVCfEz0VmmCiViMkH2DNowSW0tuuqdikKqNq4DVPqT5bfnWEIYj9yk6GpVBy1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uros3AhI; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uros3AhI"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7a9cf7d3f3so841566866b.1
        for <regressions@lists.linux.dev>; Wed, 21 Aug 2024 04:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724241273; x=1724846073; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O1cKOhqUF3zu7vgZsan9VYbVtQKA6jU1ocQV29bWQbE=;
        b=uros3AhI0T1S1phi990QE0GnwLoqtkPXm1Ujc+TCJh55vOpjZS1i2HyB2QvqzejOVS
         XIZ9iM0nV8kr64nLZOiueqB71uhr9fUXqq7rAjbzrZQeFtqIfILVWLQMpjDsJa9yplsS
         44SXCzAgRXr5t4qa/shiCSbbVlLv+LAfTOyJEhcqd/pMrQyqI0FHFe8KQz8eKszEniTz
         PdzUv/m5V2ER0jHtXU2YlFRzwsp4mJcB8bBO9GgN96RHRZ1f1B+NODXOHSHwDtE3SaAQ
         t2YbHrKwyokaehkLbJgYpOfp5IjAupqP3PavuULVL6NCppLbPS/8lDJIjMQSQKA1ylU1
         vOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724241273; x=1724846073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1cKOhqUF3zu7vgZsan9VYbVtQKA6jU1ocQV29bWQbE=;
        b=rANl/8/zEpQg0AcyyMWqenVkFmmpSq7jFpF6vCFa4D5iAbWKlj89gpMp6zRMM2EGta
         uXLdX2qcC8j0XVzchlRGgFgBujvd87GT8Pd29k+CtyawpeOGRPNtw1t+G7Y1raHuM01F
         KCEM3cqVlrEYUJt7SpRriwBt/QUep7LYKzlMihrSbcNJ3K3wXASLYdpcuh+nTWUYh87W
         EHoU/iRi7BhUHhQofcIqGyZ2Qo60XLxNa/kXhUjSe8+DaPTpElQQJqiFqAhw9DUC0vuL
         QYVgmHzXWzS+iQkEbKN8bTbHcQLE5L1VZgWKQTNlC62B+j9qd2596su6vh0ZC+KRkHpa
         xyuA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ+Dq8TFyjh3meUCAEN8MpnwvpwNEfwl7fxoHkf9L1vlA4ln6SCdwmHe4YgoQ5Fva/4HsOhG8gr6J+eg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqThpxRq75wxZM25yuM4nA0oVujueM3Kq1ocqgbN3k0vO3+Q/l
	HLCrfqBYocLZpfGjq4Za6XVh9KFOlCSRMfh5XJsr4e126v5v4H3avB3BochHLfY=
X-Google-Smtp-Source: AGHT+IFotKgao7c3MvbC51pbdgpWNBmepUxyxxfJglrrTLVTS0I2aFuu4fTaeblDXOtgwgBDsM118Q==
X-Received: by 2002:a17:906:f585:b0:a7a:a30b:7b92 with SMTP id a640c23a62f3a-a866f11dcbemr111996166b.1.1724241272808;
        Wed, 21 Aug 2024 04:54:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838396c682sm885673166b.196.2024.08.21.04.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 04:54:32 -0700 (PDT)
Date: Wed, 21 Aug 2024 14:54:28 +0300
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
Message-ID: <eb78af03-b407-49d9-b605-af9632eda08e@stanley.mountain>
References: <CA+G9fYuD4-qKAX9nDS-3cy+HwGbyJ6WoD7bZ_QL0J__A++P9aA@mail.gmail.com>
 <CA+G9fYuYfNA7NZDHpq2K24CsUn21LAb8vn38=JTz=54bsdSd9g@mail.gmail.com>
 <43be498f-5a25-4ee2-8c5d-1ef75c4d1ff3@stanley.mountain>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43be498f-5a25-4ee2-8c5d-1ef75c4d1ff3@stanley.mountain>

Give this patch a shot and I'll resend if it fixes the bug.

Fixes: b188c57af2b5 ("workqueue: Split alloc_workqueue into internal function and lockdep init")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 kernel/workqueue.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index bfeeefeee332..2fb93f3088f9 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -5623,12 +5623,10 @@ static void wq_adjust_max_active(struct workqueue_struct *wq)
 	} while (activated);
 }
 
-__printf(1, 4)
 static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 						  unsigned int flags,
-						  int max_active, ...)
+						  int max_active, va_list args)
 {
-	va_list args;
 	struct workqueue_struct *wq;
 	size_t wq_size;
 	int name_len;
@@ -5660,10 +5658,7 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 			goto err_free_wq;
 	}
 
-	va_start(args, max_active);
 	name_len = vsnprintf(wq->name, sizeof(wq->name), fmt, args);
-	va_end(args);
-
 	if (name_len >= WQ_NAME_LEN)
 		pr_warn_once("workqueue: name exceeds WQ_NAME_LEN. Truncating to: %s\n",
 			     wq->name);
-- 
2.43.0
