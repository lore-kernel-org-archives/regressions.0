Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE169125B7
	for <regressions@lists.linux.dev>; Fri,  6 Oct 2023 11:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faWI7Zkb"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-503f39d3236so2469264e87.0
        for <regressions@lists.linux.dev>; Fri, 06 Oct 2023 04:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696590217; x=1697195017; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+TRwFSu5xqtCS4GBmrR7m1FXCNdXTVhpoe8UmPcZTw=;
        b=faWI7ZkbWsIK1o8YlBuf8u+483XFmzFJq80qc2kO9uyjgHuy3DyiL1s2a6VUEPwKOy
         xUNSq+py+e+LoS6zDS3VXV4IMRuVi2Cb8k3zqFIc9CZ+GmF5YD2qpJfsvfZvnY6AeVGR
         /mTZNGt1kDo5ohKVlBXPta0gvX/cNOQdXdJScGhl15AwyQ0EnneEAWwKuttG+/AXRGI4
         j5ZvyvAIfxbENXf1Wt3VScFFM21226AdrJXBk+rS2ZRIT9Ovk3DeqaGoEtTFNp//+wq9
         UPcrnn8fjUlBkyooaNV2KVBeHTtHEZJw8oymfLLTQFna+yNgMR3mS+/8WqSza1F0D0Su
         Brfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696590217; x=1697195017;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z+TRwFSu5xqtCS4GBmrR7m1FXCNdXTVhpoe8UmPcZTw=;
        b=PBOD/Zlqvr2eXFbYU5wWk9Uxn2RoMxJK5qj3mUy2xtCpe8QtOyMx9oo98tpQXMnZtV
         fwr8NkCpY0aJKOp+PBthqc+pyu/obST6PaURusJQj6Rnt4Zq9zTpdegaLtUqqtKGsUEk
         jedWBV5wsvdwjtB+kJwTiWairZzvMVNn9xwDpDVVVAHqk6azuB8JCKf6YntUntwcPQLl
         G+HkqJjDIFames6zMSX5yLvcaH6WqD8IvSvmIV3vFoFW0C/yzCHnVBWn0sMUfqRl9IS4
         /Tj2HvIa54CjfUrM66Okd3Fl4gxs94grMwV8WyCwavVKpHuSltu7lRZCwiz7GWj87EN/
         MZ+g==
X-Gm-Message-State: AOJu0Yy2JymmMYMPaIFWzMV3MNUqg6TlbmJGpavt3v9tFWc+NHK5U4JZ
	Dl0ZFyCoZZ/Ea9bWUlg+1TE=
X-Google-Smtp-Source: AGHT+IHbJIkrY2O3p6RlIgFAJE8d2tiwnAaepkLjqi+oST9E8RjdFvBeCrjedWjwJRAvUsWAv5tVTQ==
X-Received: by 2002:ac2:5de2:0:b0:4f8:ff52:93b7 with SMTP id z2-20020ac25de2000000b004f8ff5293b7mr6840655lfq.30.1696590216741;
        Fri, 06 Oct 2023 04:03:36 -0700 (PDT)
Received: from [192.168.0.9] (88-114-1-11.elisa-laajakaista.fi. [88.114.1.11])
        by smtp.gmail.com with ESMTPSA id u7-20020a056512040700b00501ce0cacb6sm259934lfk.188.2023.10.06.04.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 04:03:36 -0700 (PDT)
Message-ID: <48b3624d-ef0c-96e7-ff3d-9f34eb1caad8@gmail.com>
Date: Fri, 6 Oct 2023 14:03:35 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: herbert@gondor.apana.org.au
Cc: agk@redhat.com, bagasdotme@gmail.com, dm-devel@redhat.com,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, snitzer@kernel.org
References: <ZR9l446ndB4n1Xl4@gondor.apana.org.au>
Subject: Re: [PATCH] dm crypt: Fix reqsize in crypt_iv_eboiv_gen
Content-Language: en-US
From: =?UTF-8?Q?Tatu_Heikkil=c3=a4?= <tatu.heikkila@gmail.com>
In-Reply-To: <ZR9l446ndB4n1Xl4@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On Fri, Oct 06, 2023 at 09:41:55 +0800, Herbert Xu wrote:
>
> On Fri, Oct 06, 2023 at 08:04:18AM +0700, Bagas Sanjaya wrote:
> >
> > > Git bisect lead me to:
> > > # first bad commit: [e3023094dffb41540330fb0c74cd3a019cd525c2] dm crypt:
> > > Avoid using MAX_CIPHER_BLOCKSIZE
> > > 
> > > If I git revert e3023094dffb41540330fb0c74cd3a019cd525c2 on current Linus'
> > > git master, the issue goes away. So I'm personally not all that affected
> > > anymore (if I'm ready to compile my kernels from now on), and I understand
> > > that you have no clear way to reproduce this as it seems strongly bound to
> > > hardware, but seems like this could point to a potentially serious security
> > > issue since it involves both crypto and undefined behaviour.
> 
> Thanks for the report.  Sorry this is indeed my fault.  The allocated
> buffer is too small as it's missing the size for the request object
> itself.

Thank you for your prompt fix, I can access the volume without issue now. :-)
-Tatu

