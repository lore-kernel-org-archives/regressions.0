Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A23717C7
	for <regressions@lists.linux.dev>; Wed, 13 Dec 2023 00:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GA7b7ftR"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-54744e66d27so6024a12.0
        for <regressions@lists.linux.dev>; Tue, 12 Dec 2023 16:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702427866; x=1703032666; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1LnE6BidxYtGaY3naq+UID6BS2mBFdrix5t5XhfBs+I=;
        b=GA7b7ftRpqgvUJeZcGB8Mlk1BdCBZLCUadvGv41Gz7jo0LQ1RkMbr5AXPqlGCmPglq
         96lXUZ9Qhwl24kjPCeGHTlQwLuQ85toRcRKUcVYny+LmIzfWeK/Y3DWRJmxfYMnWYCba
         MqGqTXZDDHa+cIon5OJAUQFu1mY7KdEjIG0r4vfWXjWTu1zTYgFygHZkWRgzlD9kZ78K
         gYFy+n5BQSKxMhURYj92xGFe1oS23YeZWzwAxtdGHVt4rfa2uQmW0sH7q9G5s7Yu3+9Q
         kMqb0VSOSKK2eyc/ws4Ac5vt+zfRyqVtGCa3PfRcbmZ0Olsnzhj3T8KmifEdZTWddTFM
         K2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702427866; x=1703032666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LnE6BidxYtGaY3naq+UID6BS2mBFdrix5t5XhfBs+I=;
        b=f+PtFhqmj8AhzoISMeCZeyGp3s9ZKre49ge0vq4OalaYiEuk/sKIRss5uJvKAfpX31
         BlFbFOoPh9rRyYSEJQa1jVOv63HvSSoSqra/92iPn4Ju89Z1KAO0gR2pITOjzKzAVF+T
         WSLQHAN++OLPwbdABS2Xz2/YNVvOD5HHtAlc4FE6ekIDv7yEiHIDwR5wKOmw6viP4OYe
         /9v7k3I9JcJk8Y7IAvj2y2iAbpGC7m43TfcAsqXJmg68jOQI0XGHo9WWOnwMJFlBeM/U
         JGo2ug33gGAr9ABg58K9buPTwc8I7/TbPuggkHU4KXJfAD37EuWXzTvqZsi/kplHWXbI
         XM4w==
X-Gm-Message-State: AOJu0YxqVCbIKseXET7GlnDVbp8kfc9zwXF/CQzUVBFbUTtfzLul9QAb
	wAokEdpYL+Lzzuumd5qerbCouUl9tGIqntXZWFg/
X-Google-Smtp-Source: AGHT+IGnMQRiKEPWZSvwWYwwY8FAhUWy825RQ67iHfal2GL8IR+NeDwrblzRUmQldUIwiAa92DPPmgK9pAj6EIrAdq4=
X-Received: by 2002:a50:d601:0:b0:551:f450:752a with SMTP id
 x1-20020a50d601000000b00551f450752amr37151edi.6.1702427866162; Tue, 12 Dec
 2023 16:37:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000b505f3060c454a49@google.com> <ZXfBmiTHnm_SsM-n@sashalap>
In-Reply-To: <ZXfBmiTHnm_SsM-n@sashalap>
From: Robert Kolchmeyer <rkolchmeyer@google.com>
Date: Tue, 12 Dec 2023 16:37:31 -0800
Message-ID: <CAJc0_fz4LEyNT2rB7KAsAZuym8TT3DZLEfFqSoBigs-316LNKQ@mail.gmail.com>
Subject: Re: IMA performance regression in 5.10.194 when using overlayfs
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, linux-integrity@vger.kernel.org, 
	regressions@lists.linux.dev, eric.snowberg@oracle.com, zohar@linux.ibm.com, 
	jlayton@kernel.org
Content-Type: text/plain; charset="UTF-8"

> Looking at the dependencies you've identified, it probably makes sense
> to just take them as is (as it's something we would have done if these
> dependencies were identified explicitly).
>
> I'll plan to queue them up after the current round of releases is out.

Sounds great, thank you!

-Robert
