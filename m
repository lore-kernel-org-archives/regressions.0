Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2881EB25
	for <regressions@lists.linux.dev>; Sun, 10 Mar 2024 10:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710067541; cv=none; b=JMSegOeqAUXJlUJuNEsqbaVWTeyGysEdnYxyWhnJS0GtXHRZYRoedddvwBK3oMuS6ydO41an/6YJd2wDwxAUnAHkYsQIuZ9cmUS6BaJEzyECLdo51ZzFxtZAQ7ZOwnocw2rJwaYDgFl0ZL+O+NILxzdsg2/SLExUuWFnXsyu0ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710067541; c=relaxed/simple;
	bh=TxP61Svxv1Z1G0KcqQCe329Ydbu2E2d9Wa6rwAuMW7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+p1JWysWTgUTexmPmSfPvGvC3WwUGd7yvqCTKCpCLjcY17wYZzQFGXBLSv8rHl60m5vTsiO3gJ1whQT/WL0cN8GFfvO2k/SeecsX4QDwwj68o5tyaf5rxtxN+j5b1FDDHR1PJ+2STSeajGBV6dIXjMvnZAH2UIKczynuCWY8Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxBNR3M3; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxBNR3M3"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33e899ce9e3so531674f8f.1
        for <regressions@lists.linux.dev>; Sun, 10 Mar 2024 03:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710067538; x=1710672338; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TxP61Svxv1Z1G0KcqQCe329Ydbu2E2d9Wa6rwAuMW7A=;
        b=KxBNR3M3FnoGbz4ICa58x3GLgVRrEFbB5CurkVij+jtjTvM5db6a7RoW2klj6qaptd
         Xcch6h7HhgxM1M3VGvzTHoV4L/tkQH0vuV2pbuRk0xT5B8drIbuJR6/BHCD9XnuJ+NN7
         vQ+sV5Vt0hbItOkRkXy6DjgeWEbDDIS4b0TQ+oRILuhcA7HTnwiTkEuGmGl2Ctcze3yR
         DYLYcnwuwiNfSJ78K7PJmPU1TSlJaerGZT1RnpUKC1pjw+uiXztuSCB1zqqgC6Ve3SIV
         3snpYSBEpXieD0dg1swbLR+oU6jIrurs2zl9PToulWUJ8IYfo+URtcuBPa+lWMKyEUEX
         +Y4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710067538; x=1710672338;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TxP61Svxv1Z1G0KcqQCe329Ydbu2E2d9Wa6rwAuMW7A=;
        b=FydHsNwnBRRLHquuy+h+QZPjQ9h5VKZi5UmxwJ4JS4QEltczHeOpgnPr5HENlOAXkQ
         2QCdMnOi7v/x7QyTEJWpdjQ19B/FxQ94U7lDRF6U+ZUdNy1/sAexFW7RftehRQBqtW1o
         AYXwvR1uyqVcJ2+9zSNJh4evPw3MOgFNHI/mKLciYvS9kmCB7nNkD4WavcrSl2P3bcUo
         yUJAkgHqiXCPsrXcuTTszVElf9r03wid1D6xOtTTx5DQpDUULEnCaXTs2hfxxUSVJw/1
         gDB4aYIwWnilcpjMbU3nsqolrg6OOQTnfL+T2QmRubMLVB+hUxPmLVYblmA+nIfFHrnP
         6bqw==
X-Gm-Message-State: AOJu0YzbV3s9OG1c6wdMShN2l7L4B11pBy4n+NgQWWbm4RtIyoTH8FNy
	+5p0PyTlu3jpGh5fWs5KFgBEOZi3CoK34MzLqs671GFjU/ERHJr7
X-Google-Smtp-Source: AGHT+IE7ENyLlO7LAGnBj7Gvr795dqnUqmwEFNXEJfq6m6CvF/yXl0PROLuXj6fVJsWpd2x7m18hPQ==
X-Received: by 2002:adf:edc9:0:b0:33e:7133:ee31 with SMTP id v9-20020adfedc9000000b0033e7133ee31mr2425703wro.40.1710067538431;
        Sun, 10 Mar 2024 03:45:38 -0700 (PDT)
Received: from debian.local (80-44-66-160.dynamic.dsl.as9105.com. [80.44.66.160])
        by smtp.gmail.com with ESMTPSA id q4-20020adf9dc4000000b0033b6e26f0f9sm1988784wre.42.2024.03.10.03.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 03:45:38 -0700 (PDT)
Date: Sun, 10 Mar 2024 10:45:35 +0000
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: regressions@lists.linux.dev, trivial@kernel.org,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Fix typo in reporting-regressions.rst
Message-ID: <Ze2PT8oamTSm23ny@debian.local>
References: <ZeoDMtLGIHvbavW2@debian.local>
 <cd766a41-4dfa-4f57-8af2-163023acbead@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd766a41-4dfa-4f57-8af2-163023acbead@leemhuis.info>

On Sun, Mar 10, 2024 at 08:57:55AM +0100, Thorsten Leemhuis wrote:
> Which leads to the question: how much do you care that you patch makes
> it in? If you would like to have a fresh commit in the kernel (which is
> totally valid thing to want!) we definitely could improve your
> submission and then adjust Nícolas changes on top of it -- but if you
> don't care at all we could just directly take Nícolas patch.

I don't care - just take the other patch. But please fix the multiple
incorrect spellings of colon ('collon') first.
