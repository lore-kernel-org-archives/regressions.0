Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7866192D89
	for <regressions@lists.linux.dev>; Thu, 12 Sep 2024 22:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726179162; cv=none; b=rqMaYSuFs3292YQ+JaCS0AL7MKM4vE0BeSNh2jMhfJSeectFBrLkVAeHSes66JP9DGGppSCN6kTHrmPrnbyMcDoz8LOhTEBiFiOaGnQWEYdu5WiBcyUTG2Ksprw0jGnRWhG+7239jHhI9MRyh0K/1XD9LJiJmK1htN2iQe02Djk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726179162; c=relaxed/simple;
	bh=UlYy7Hlbdt+rczKfYZZW2LIR+Y5Cgkp3NmyR7eArPLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H0A4YQOrwXCA4hzdGuq+pnSDptVmf5+PnZl81keYpP7tPKsgM7WrIrODOiNkL/wvWX6o+2eLQdPnLJ+lu3/HUDT5zAYq4M63BpNbXDmDQoTIXlnnfPGIHtudjnJTWI9Ikf2SNpA0Rm/vITcIu8PtKriZIZ1vb9lKqqCt8Kv7o+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=o9/iq/ZV; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="o9/iq/ZV"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7db12af2f31so1428236a12.1
        for <regressions@lists.linux.dev>; Thu, 12 Sep 2024 15:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1726179159; x=1726783959; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6XHoL0ZBi9GE7Zl5WoiwZ5w6Gz6wVLeamEWBzoE27iE=;
        b=o9/iq/ZVVW1sF1q9Wa2Hgpli9tQMrdY7bGTNwgaxdtEqUuJ95L75iqBcvyP0LBEDR+
         4EeecFv4F2NWwRrUL/qzDyH6/yXIzgTSy9ekLw17L1Kws97YJFsTxMYUikgAtCKKdp2H
         g58F7E/Rf4mmbCWqOvVsPC+vHgROWAl4gNKKZ+BIc81xRN1Ocjf9Y9vq88ifv9B3oM2g
         ud3cW7MCG0GEdfDDHARSaZ1ZYnYWfqAkpHfAXNcEYczZzsRPh1Sexgy2oYduoo6J+Ulh
         kIqzxevxbD4Gh0oh5H3EpZrB/4aVth4M1arv0zqmN1tNcPjlgAArlv4Bb6pKwO+nAQQq
         GKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726179159; x=1726783959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6XHoL0ZBi9GE7Zl5WoiwZ5w6Gz6wVLeamEWBzoE27iE=;
        b=uuI27iPLeIHth6f4JjNrk0ScZcRXVAEtufvtbEHLc5DSjtpKLJZnv3xFafZlSZhrOf
         dLx/5R2gvAH5bdYJR764wGaGJ26f7ys3/Dqx2uyU5M1r1cX2mhgUlsu7SXlBRSSDhEqO
         kSV8c7Kkm2w0dB2M4VgfF03XGoyDS43BkkkkzmWXUCBSQZtYH7ipajUK9fIuzqlYoVBj
         XeCq+2h37VmYCS5lKnGMWcI3BwsXs4ILsdxdY8scQrPh3oD/NSPh4VwHMidIwmCP3hvX
         WY612weenOp25Fw/1/HgZc+ZBmC7F7IBqS//ELYU6H5tLTbaN72R+nijktpRdn/doPvC
         ld9A==
X-Forwarded-Encrypted: i=1; AJvYcCUlx6k6PQ/+lMUFgRSTwVEdCl5QoDR+wKld6dgo2EyZGBczaoFQLCMpqhnfnaOvfnpPQ3JUC2/s4PIheQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWuvElV/Dqc9kGcksmfDNLbuq0TWWawLf4A7dvo23pfvRIhNI7
	wndJcX8vNkc+7jx0+FWqAoKRxSUmMYaOe/13yox0jYQd6dQ9ASteuAW7xYgLFzM=
X-Google-Smtp-Source: AGHT+IFpTCq6+ukL7H58M1PsiI9W1iyXsSunsAA643ZhHhX6ctp4jDxCLQSXqpQypnPnbrvP1So3dQ==
X-Received: by 2002:a17:90b:4a4a:b0:2da:7536:2b8c with SMTP id 98e67ed59e1d1-2dba0082fecmr5160596a91.36.1726179158919;
        Thu, 12 Sep 2024 15:12:38 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbb9ced741sm211330a91.39.2024.09.12.15.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 15:12:38 -0700 (PDT)
Message-ID: <0fc8c3e7-e5d2-40db-8661-8c7199f84e43@kernel.dk>
Date: Thu, 12 Sep 2024 16:12:36 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Matthew Wilcox <willy@infradead.org>,
 Christian Theune <ct@flyingcircus.io>
Cc: linux-mm@kvack.org, "linux-xfs@vger.kernel.org"
 <linux-xfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
 Daniel Dao <dqminh@cloudflare.com>, Dave Chinner <david@fromorbit.com>,
 clm@meta.com, regressions@lists.linux.dev, regressions@leemhuis.info
References: <A5A976CB-DB57-4513-A700-656580488AB6@flyingcircus.io>
 <ZuNjNNmrDPVsVK03@casper.infradead.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ZuNjNNmrDPVsVK03@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/12/24 3:55 PM, Matthew Wilcox wrote:
> On Thu, Sep 12, 2024 at 11:18:34PM +0200, Christian Theune wrote:
>> This bug is very hard to reproduce but has been known to exist as a
>> ?fluke? for a while already. I have invested a number of days trying
>> to come up with workloads to trigger it quicker than that stochastic
>> ?once every few weeks in a fleet of 1.5k machines", but it eludes
>> me so far. I know that this also affects Facebook/Meta as well as
>> Cloudflare who are both running newer kernels (at least 6.1, 6.6,
>> and 6.9) with the above mentioned patch reverted. I?m from a much
>> smaller company and seeing that those guys are running with this patch
>> reverted (that now makes their kernel basically an untested/unsupported
>> deviation from the mainline) smells like desparation. I?m with a
>> much smaller team and company and I?m wondering why this isn?t
>> tackled more urgently from more hands to make it shallow (hopefully).
> 
> This passive-aggressive nonsense is deeply aggravating.  I've known
> about this bug for much longer, but like you I am utterly unable to
> reproduce it.  I've spent months looking for the bug, and I cannot.

What passive aggressiveness?! There's a data corruption bug where we
know what causes it, yet we continue to ship it. That's aggravating.

People are aware of the bug, and since there's no good reproducer, it's
hard to fix. That part is fine and understandable. What seems amiss here
is the fact that large folio support for xfs hasn't just been reverted
until the issue is understood and resolved.

When I saw Christian's report, I seemed to recall that we ran into this
at Meta too. And we did, and hence have been reverting it since our 5.19
release (and hence 6.4, 6.9, and 6.11 next). We should not be shipping
things that are known broken.

-- 
Jens Axboe
