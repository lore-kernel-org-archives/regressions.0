Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CD2137937
	for <regressions@lists.linux.dev>; Mon, 20 May 2024 15:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716220078; cv=none; b=L3ZC8lb8+v95s2bJlhfp2KGCr7mt/louy92LwrNb+AEWKt/cCNlYFqXbaedOO+/RcnJw5cfG7CG7k6z0T8bYCoIQtyfPxiMUHXs/MCB69Guo4b9WkAi9pPMhVcuEcUdf9+xVLJHfRhRuobMcflGFNbfF0w8WNrHC/PVUksUrl1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716220078; c=relaxed/simple;
	bh=ZuCCG0Eh8Xgw2NOuuyCpM66KlU8bbuYCifixtDNZtcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckRZpxn2zETwNC2a4vG3l7UwFLZG4Ab6wBzGC13plQhHY6btxafiQDVL3KDQoVkBqJHDBNBMgIuFCDWA4v39Z5T0SbJoHS8oZD4+wQs3JoIK4jV+0ZK+EWDcm2/y+QBju6+VU/5WDxusx1DcUtLb6quIC2w7EGtU8A9U35Sib3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=none smtp.mailfrom=snitzer.net; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=snitzer.net
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-78f02c96c52so207067785a.1
        for <regressions@lists.linux.dev>; Mon, 20 May 2024 08:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716220076; x=1716824876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+Wt8B7c6VGTELIjpW5Obe1Jy6ixX5wSQstTQRsPbNk=;
        b=SYrbVYDWlW7vo1dbN3CjQDTSeYEkJnGK5Ns7+uKe1Z1e4AWVX6UfIcznr+gyNidsd7
         DXzCiE2M41yC/UYtxrGj5St4ZBsGFqV+AqxnfrTQ+hmmDwob/UjmnQ/dJ007w8JyFR8j
         UxYS8QlQqNdw/2G/DIBYImM6duEwH7umii1Bjt3y06n1KeQSDcyO0dTcuoB1MfoeqDf+
         rcmzFBmrBe9obQDd6wIpx5JjqCRdSLPJXFRDojbI0VEBn5DgXjQZ/bxmBWUfaPQy1/9k
         8R/LQrKgte5zCkLruwcYn66DP3U4DNhIPMGyRyn1zYs/NLvmzv7LRUuBXAxr01HVKvli
         btXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3NKyi6nz8uYC27FBkEFF398T6WQz83kE9ggQYAqTURgSagMLZ/08IWx3xnLBKJBqRb4n6wnLO9Cf4ba+XZgcvizF7K7w/ijnngj4=
X-Gm-Message-State: AOJu0Yyd/rnoYIe54gcGz3yCvdMhXITD2rvV/QRkR17iAfh1wdbAqRsM
	iX/7rQozxUjNxdZqnR4iw/0CxBtdPNW6Mqn2PFj3j2rb9ap6ssje29TGxQ124LU=
X-Google-Smtp-Source: AGHT+IHIHKE9GFBMokfiBwe5Y1Cs6m7LOg6UKKNinEya5SdkKaCvkyLpek0VNjsmYX1Ubnk/wyse3g==
X-Received: by 2002:a05:620a:7284:b0:78d:5065:c5df with SMTP id af79cd13be357-792c7598d0cmr2889300585a.18.1716220075963;
        Mon, 20 May 2024 08:47:55 -0700 (PDT)
Received: from localhost (pool-68-160-141-91.bstnma.fios.verizon.net. [68.160.141.91])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf275b12sm1201023885a.22.2024.05.20.08.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 08:47:55 -0700 (PDT)
Date: Mon, 20 May 2024 11:47:54 -0400
From: Mike Snitzer <snitzer@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Theodore Ts'o <tytso@mit.edu>, dm-devel@lists.linux.dev,
	fstests@vger.kernel.org, linux-ext4@vger.kernel.org,
	regressions@lists.linux.dev, linux-block@vger.kernel.org
Subject: Re: dm: use queue_limits_set
Message-ID: <Zktwqu-N0E1miesx@kernel.org>
References: <20240518022646.GA450709@mit.edu>
 <ZkmIpCRaZE0237OH@kernel.org>
 <ZkmRKPfPeX3c138f@kernel.org>
 <20240520150653.GA32461@lst.de>
 <ZktuojMrQWH9MQJO@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZktuojMrQWH9MQJO@kernel.org>

On Mon, May 20, 2024 at 11:39:14AM -0400, Mike Snitzer wrote:
> On Mon, May 20, 2024 at 05:06:53PM +0200, Christoph Hellwig wrote:
> 
> > This is probably my fault, I actually found this right at the time
> > of the original revert of switching dm to the limits API, and then
> > let it slip as the patch was reverted.  That fact that you readded
> > the commit somehow went past my attention window.
> 
> It's fine, all we can do now is work through how best to fix it.  Open
> to suggestions.  But this next hunk, which you trimmed in your reply,
> _seems_ needed to actually fix the issue Ted reported -- given the
> current validate method in blk-settings.c (resharing here to just
> continue this thread in a natural way):
> 
> diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
> index 4793ad2aa1f7..c196f39579af 100644
> --- a/drivers/md/dm-thin.c
> +++ b/drivers/md/dm-thin.c
> @@ -4497,7 +4499,8 @@ static void thin_io_hints(struct dm_target *ti, struct queue_limits *limits)
>  
>  	if (pool->pf.discard_enabled) {
>  		limits->discard_granularity = pool->sectors_per_block << SECTOR_SHIFT;
> -		limits->max_discard_sectors = pool->sectors_per_block * BIO_PRISON_MAX_RANGE;
> +		limits->max_hw_discard_sectors = limits->max_user_discard_sectors =
> +			pool->sectors_per_block * BIO_PRISON_MAX_RANGE;
>  	}
>  }
>  
> 

Maybe update blk_validate_limits() to ensure max_discard_sectors is a
factor of discard_granularity?

That way thin_io_hints() (and equivalent functions in other DM
targets) just need to be audited/updated to ensure they are setting
both discard_granularity and max_hw_discard_sectors?

Mike
