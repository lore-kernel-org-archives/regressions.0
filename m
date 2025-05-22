Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F47A1DF721
	for <regressions@lists.linux.dev>; Thu, 22 May 2025 20:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747944483; cv=none; b=tvZXRZ2PqzHlCtyrdTGe0hu0MbAitXqADtbOdldeaPlNHeCIsDO4xmlB2U81hwahEWA0m6gMZzFtJjTKcZVHSCkJeJuoR8MYxFp+h/DcL7UFIAsVhaCLQRx0UrHZBFyX2vWplcOOgseRAgLWnbnXdsgNU/m5hICUQ0H5hX01FOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747944483; c=relaxed/simple;
	bh=BUCLC3GDDDNi++xQJV2x9OdVC1R2H2qikmN94FNnCoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=to3w7+YjhdbkNQnxMyohsABVGGlMhu0bCA5+Q4bh8/D8M+B6Vu1chsn+0HZnumRQ7B/o+BL0W1FPtogc0JFFIiQjfxt8zJvfp7/pzUj9BI6EFMTgzR+8ADkZsCTA0VV+Rc1vu9P15hhhHNayo4BXMwxEahK/oPIbRBW1V17ENDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYP90FgJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYP90FgJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so1706905e9.0
        for <regressions@lists.linux.dev>; Thu, 22 May 2025 13:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747944480; x=1748549280; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G5gpVCcMV1i9snPwFeqD1LIyAIQqJtgrDKNKGxDbPqo=;
        b=QYP90FgJznXh500aQXX7vFxpHQLrcErMlwOE4w91d0abVPE1U8JJkPmrKGIU6zxUuc
         Lt2irEvcNiqnm5lTmuWrOqVvHQqg8l9HTncSS1ywUOji4Zof88RpLhC0j0KfslNPpaJx
         ek6sq0AGfL18g9JwDQmudvSz63ZhnfvYXw+Z5N4g9g9/WsdRPiRF49DlX6ZBa58J1bEO
         tfJvkgznvDQrHffe9vrF6UPIACsrws83nb8RzJuZkdf1pSnu82ivHJjrUkFoIk49OGgi
         Wj7o3TbLnrr07cCjymVJJtkmXxOQ0CtZDbhu0taGD+E8sn25Tz2jvzug8H8HVyqXpbxL
         nFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747944480; x=1748549280;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G5gpVCcMV1i9snPwFeqD1LIyAIQqJtgrDKNKGxDbPqo=;
        b=Z6kDrbQ4IJpU8An7thRz2LDNKEi+Y5+Bv8ezfPf9RHi1W5H6FASTojUjsXl4WDwWTB
         aeOPEVYlCRF/L3K8rFOhXIOR+/2BOFvEu+SBuBoRVXWSEbxdpOVQOmkFMmepWgDl448P
         tkN9q/3goIYRfqwNQ4t8+geCsYoDWLTOn/UG717bM5XjngpEkAWfq+lOirCLWpP3C2Yj
         1bUtMeLzmbvlXfzRJU4L3WRBRbGzEGl2xYtPvp3l3bjfUrHRvFgZz3ixUfr/ZVnE3qis
         JPsvVvYhmrwzuMu4rC113U+ecxfNR91KVzph+D0NKmJ2jtynkODxqpfGFQnhV0TT7il6
         fKVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcApePgGe7XuQSHax8Z7LBOv+HuHKBk632DU4tUthachv8TfbVi0n1jm8SaE1w8OcG/2dnJYMovYHk6g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0KmwR9oymOqJj5aVL2EWgQC0IHH8nBVZ2jujZCpnD06HfqoIw
	aWvcFLU1MvI7r9nCXEIHewuO/Wrnc6HvLlOHHVZ6Yv45Z2kro96rkiBH
X-Gm-Gg: ASbGnct/LdBedpX4bvjbmWAutx3Utaf/6wctS1d56kG4ZGFwrB97/t8OMxJXnhvCEvy
	o0YFND7JfEDjInitIaqwjn2GLQjnP3TSNSJv3V5iZKAq9ChCd1m7DGim+YfOsSVNFxQVv8NAKus
	gsBjpwvuwnmSH7OLhanInSDX8LFCnm7MpYmws4crjekduYW7IiQjLDmukR86WGY0zHC7b/rnsSk
	VGTXl6PDVk0kOA2+jD80ROV5js7lTkoPs2oKSZeieXI554kxItKq5YKAhYPOUv5zV6seDE1A9TZ
	nV1vXeqm005wyNYAhZkVRfhlOpXiUY/SrOZeq7hG3BhtQQNu/i0O
X-Google-Smtp-Source: AGHT+IHiscUjYHw6hRgf6vQpphZCl8lZi4zCqb+M0K4BvM0wTOLA0OOWMHCxOMl33M+fLv2bdqFSaA==
X-Received: by 2002:a05:600c:3d92:b0:43d:b33:679c with SMTP id 5b1f17b1804b1-44b529ff7damr8348965e9.14.1747944479294;
        Thu, 22 May 2025 13:07:59 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-447f78aea59sm120824755e9.25.2025.05.22.13.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 13:07:57 -0700 (PDT)
Date: Thu, 22 May 2025 22:07:54 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Klaus Kudielka <klaus.kudielka@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	EBALARD Arnaud <Arnaud.Ebalard@ssi.gouv.fr>,
	Romain Perier <romain.perier@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Christoph Hellwig <hch@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: crypto: marvell/cesa - dma_alloc_coherent broken but kmalloc +
 dma_map_single works
Message-ID: <aC-EGr50MIVJqwVn@Red>
References: <aCczV6MF6xk5rRA3@gondor.apana.org.au>
 <aChx_ODF_hYKL8XO@Red>
 <aCmTQoJw6XG1CkuZ@gondor.apana.org.au>
 <aC1fY6IP-8MzVIbx@gondor.apana.org.au>
 <aC2aAvX07Aaho08d@gondor.apana.org.au>
 <aC2uvvzlR89iVFGW@Red>
 <aC2xTI1ZuXoZjgjX@gondor.apana.org.au>
 <aC3cF0-bWb-Jiz4i@Red>
 <aC6TkPM6mOuFwvkD@gondor.apana.org.au>
 <aC7UbAIDA46olNJL@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aC7UbAIDA46olNJL@gondor.apana.org.au>

Le Thu, May 22, 2025 at 03:38:20PM +0800, Herbert Xu a écrit :
> On Thu, May 22, 2025 at 11:01:36AM +0800, Herbert Xu wrote:
> > 
> > So here is the latest debugging patch with dma_map_single on top
> > of cryptodev.  Note that the partial hash mismatch code is buggy
> > but it doesn't matter because it still prints enough info for us
> > to interpret.
> 
> Oops, I screwed up that patch.  Here is the corrected version.
> 

Hello

Here is the result:
http://kernel.montjoie.ovh/479404.log

I have built by adding also your "crypto: marvell/cesa - Fix engine load inaccuracy"

Thanks
Regards
