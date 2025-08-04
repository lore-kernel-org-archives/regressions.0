Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEC926FD84
	for <regressions@lists.linux.dev>; Mon,  4 Aug 2025 13:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754314369; cv=none; b=TjXq0TGYqSSWu5LL2ivg939l3i/zJm3LJZckX3tZ2BW4wQ+QKZmK0qVLCIho204084wHFotWnRXWp8MBztv1iNbUJgWTCnxRG5dTpNGy2AxlVOTsFZ0RqHX2ICCU/u0WE+zH9ZG2hptxMfC5oqQmDRykDzvt4C4rjdaeSzIX1c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754314369; c=relaxed/simple;
	bh=c2zZubdYruK/gDLxhJT/Dee+/3njse4nUBcteSLRYms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtqYEmvPI8mH8Ga4yRYqZpRZFhsB6/Il1eTsTOosPiWCKeYHcslGkHRVO71/ZD15erH1UGcA8zRJRa2EIIZUWGAtZtcUIFQbnm8wgg13MpysagWB4I32iwXWeV+nyDjj4RrH4PaRTaOa95sXjumwp+zxHZzGW9ZABnRqjCQI198=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=boUjKes+; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="boUjKes+"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-7076eaa5febso12523766d6.2
        for <regressions@lists.linux.dev>; Mon, 04 Aug 2025 06:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1754314365; x=1754919165; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ARdbuY4ihnBfNqmPKZqv+tAobgDvylQcvqI7MjhLvS8=;
        b=boUjKes+q0aCWiJIDyLGoq8e4gohYT+lXIjuKfHNnJI4uRiHZMcsLiWJO4D3FbIu3G
         5S4/hSlLYCCLC9veb9FZEuyqu5i4yXOppozfVbmKwJagN2/g6pIh3nDy2YEFeQSuBj1A
         hZ8+wGdWBkDpIOWkyF+yqiO5L7BqXH2BmAjjcU7kH7OIH3dC5aHrv33CyRHt2rRYqTBv
         DsVP1eYbO69EU4uU1w5ozHBwg4dyp0z8lCnfpEtEwOoNVNY0/ZdcqbCFoaqdz+lFxfiW
         1xE/k52S1acA35vvSh+GSc5m+KCdkYyCpt0lRfaYz9UO21GELv1VRhIzs/nzWeoki+/S
         +NcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754314365; x=1754919165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARdbuY4ihnBfNqmPKZqv+tAobgDvylQcvqI7MjhLvS8=;
        b=Iuas+vLTrU2ZI15MO7PF0BvX5zh/htL7kDv/qOyRMc6tAxQmW/uBK9T7RpbhlDUaHa
         0jpkIToOOacAKzRBJQB/X7rxTGxZ9B+yW3Ilay+3CzI9OqoZ30gCIQPdvLuRw0KmOH5v
         jRQ7wvP6+HQZVef9pT8mpoA45agevULFQwHtmXXDrMQeZxEfDtXsVnhpCXD3R2Zr8WQc
         b4pfnhvgF4tiL+4xdsvV40ucDmDIRUwumzKT0VqDUOmoTDr1TahdAG8AX17b2nAkot/p
         5OSCmzM0UDQjEOEEH0ZxRJ4ikx84Jnwy1hNkteReEOLigMBpE3EqxQRw1BqHSDbVdXxp
         4enA==
X-Forwarded-Encrypted: i=1; AJvYcCVxi0g9HRVWbP+jcB0vjKcQTD85J82njKpdYLYLrGghW7YTUOxLk6WaVZM7b6JqBz2f5cKwSzzLg3Rn7g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/m9ljWH5qGbGNCDJkzJz0kNwuNGCmdO34FQ6USyGDmsPYTyeY
	atX6MoAWgns1mBFuCU2vWq30pBFBvRijF7gsS7X8MBSGi+qcJGBOJd9LleEJ4xHJLgU=
X-Gm-Gg: ASbGncsbbixcxY2HsLV1Vx3gxRFqVeKWguaQqFNZmkzvgBZXAjqSw6JhQRBu7wnZ9Oc
	I6lkoGBQPIcg/PepyA329LZ3xPgLxZ+c9RtzqW+3Hq09blJ+yIByhouwKerbVx8vZCibWQc+mEl
	1lmRwVVl5MZ8mjXX091sFBnu4FPcUnC+IvA+YjsJyBxFUijtRO1cD8k9W2oldU4xkwQZMx7eea3
	4Xb/FOErhuisNKUi3dcqPDm8uePlnd/5CvQQTViFX0Ipq64s7IUtSEnKxTGB4nywD5zIxsVGZYx
	Lmno7EIGkY14SxxVcCjPoFsXxTCg1HLPi68D7/+tlHrnNgsrD+RG43FKUGVqSo7Vh2aMYzq87es
	2uJdIQ9E3l7dQfKri3PvDTg==
X-Google-Smtp-Source: AGHT+IF7J9OrujvHAgN5i0H7oCNZ6uBRyDC1EFC/YvErPRsiTQSvUU17oBWdAHJzGy7XoL/W1tODjA==
X-Received: by 2002:a05:6214:4015:b0:707:77cb:5b0b with SMTP id 6a1803df08f44-70936243ecemr127645756d6.26.1754314364892;
        Mon, 04 Aug 2025 06:32:44 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-7077cde6062sm58097776d6.71.2025.08.04.06.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 06:32:44 -0700 (PDT)
Date: Mon, 4 Aug 2025 09:32:40 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Chris Bainbridge <chris.bainbridge@gmail.com>
Cc: linux-kernel@vger.kernel.org, surenb@google.com, bsegall@google.com,
	dietmar.eggemann@arm.com, mingo@redhat.com, juri.lelli@redhat.com,
	mgorman@suse.de, peterz@infradead.org, rostedt@goodmis.org,
	vschneid@redhat.com, vincent.guittot@linaro.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] intermittent psi_avgs_work soft lockup
Message-ID: <20250804133240.GA1303466@cmpxchg.org>
References: <aI_fUhpBrIBrJ073@debian.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aI_fUhpBrIBrJ073@debian.local>

Hi Chris,

On Sun, Aug 03, 2025 at 11:14:42PM +0100, Chris Bainbridge wrote:
> Hello,
> 
> I'm getting intermittent soft lockups with recent kernel builds. This is
> a new error that I haven't seen before.

This smells of the seqlock re-init problem in 570c8efd5eb7. Could you
try to see if the below patch fixes it for you?

https://lore.kernel.org/lkml/20250716104050.GR1613200@noisy.programming.kicks-ass.net/

We probably want Cc: stable on this patch now that 6.16 is released.

Thanks
