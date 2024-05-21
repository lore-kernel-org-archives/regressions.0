Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521C236B0D
	for <regressions@lists.linux.dev>; Tue, 21 May 2024 18:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716316187; cv=none; b=Mj85+wJz+X/was36mG7yZHF49Rhet6NFX0gmPSIveXlyLxddlyOx0oI9ocLTei+iFpmFD3fPaaZ4hhrTYXGdzh+yGSuvbz+8+/gc5O4xrH/h5XoVJJBXujmZdB4MuRC1A8g987RCpuW41+J2JPSQ37o+EXkq5er+n7fQJ+QMF40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716316187; c=relaxed/simple;
	bh=dgdXpkIhU+y9iHEBqZOvE4CDrXAha91+KB/GLyOImZA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=edJ2ZZ5BDstY13GRtEGFoWFVBwAArF67TvFgM8Jg3o9FZ4hFzSTWxj4M5KwL9yV0yw8drJ1+1uZqjjmHiFCzpU2eTBbRSrokQSijALKh3NKYuVlUXQaYPC9iuHK1LwDa0fiyhOJvsFTFtWyLOyw2ILuV3uEpaXO3IJ4EBzZ7ywE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=gixNwn/n; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="gixNwn/n"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7e24bcce578so14234639f.0
        for <regressions@lists.linux.dev>; Tue, 21 May 2024 11:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1716316184; x=1716920984; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QiL8jPCVLJm4ChkHzmJn8WCo6IbWuNrnx20w9l78O+c=;
        b=gixNwn/nnuL2aTbHAv/8x5ArV/HIdKJ3DHPnIWh+YB6qGxqaBKWsTfq7f5iM6SW6PM
         N30xPydhOvHamWqha93/pd6HTiVUad0eM/sbPz0AbUx3sJIMWVPFKmPVqsSf7Uo4iK2Q
         DJoFeDleuu/yicZFnr8lKvAMSgjGH+4z2wmh58+DodkKH/j/2zm9UH1qQTlwXOEh3KJy
         bOQ4TgH8U+/F8tmAR4Tgmvn/Xti8cBPOK97ovaiSHXNF4tIo1XkB8NhFDcQZmsWPxRg0
         GoWiSPx+MjMWzAy+wyLhaQ6F8uqNV3XRwVAYloEMNnl7FZicErBDT1D7sLbtthBGdhUj
         WEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716316184; x=1716920984;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QiL8jPCVLJm4ChkHzmJn8WCo6IbWuNrnx20w9l78O+c=;
        b=DzepCDF2eH9XjSXFW7I+jXz/AnC88FavdXwETR1oYvvRguT9DpDp3b6uItDXn+6g01
         QxDYi6MaogCQA7brtmtzfgSMwdTUqi4Gmf1Sss9zRRqQ89sKBFlJ+QNJTpjyjwMGeFEl
         kR1n7x3GEfvFh0bbzAupoMoVeo8xwcMSwrVVgvXc+TL7UnNuKdK26k119LlD5aapRSxQ
         tCI6Cy2YGJSdB9VDNB+ecXivkA5ZwXyoRPxNZxXNi2bpGyCKZI/Grt6mgzAe+K9E4rmJ
         4qK5oOKqy22yEHUQzuzlR7CHmKMe63AM2ynglO7TRKSDdhcANPle3gMTxSw6Ag86+rNc
         cNGg==
X-Forwarded-Encrypted: i=1; AJvYcCXg+VhVsUycnvrYn/jIxMyG2cYj1krkcExBDZ4gwV5m4VrKtqoVUPuVh+zqKWgUsgGHrbanWSjrDfDoDWqIzdHj983gQvSGn7r61lA=
X-Gm-Message-State: AOJu0YxGbv8xy/jyB1CbZuXca47TfVnEG9NdC5Ti2kA6gtKpsoNLzdaG
	6IJJyExJlAP98nefYfAk3bx1wMavmUn9HzvQHZ8aS0jRZ/i/plX1ss32W3gILj4=
X-Google-Smtp-Source: AGHT+IFRYPG2Ng3/qufyEbP7kiQVtzyIgSegpCO0NthddraXsbj7qpouf4hoXqCV1QNRdJw05Qyr+A==
X-Received: by 2002:a6b:d203:0:b0:7de:e04b:42c3 with SMTP id ca18e2360f4ac-7e1b5022577mr3343650839f.0.1716316184314;
        Tue, 21 May 2024 11:29:44 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4af93f3555bsm213969173.98.2024.05.21.11.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 11:29:43 -0700 (PDT)
Message-ID: <0ec1d936-ee3f-4df2-84df-51c15830091b@kernel.dk>
Date: Tue, 21 May 2024 12:29:41 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ETXTBSY when running Yarn (Node) since af5d68f
From: Jens Axboe <axboe@kernel.dk>
To: Christian Heusel <christian@heusel.eu>
Cc: Andrew Udvare <audvare@gmail.com>, regressions@lists.linux.dev,
 io-uring <io-uring@vger.kernel.org>
References: <313824bc-799d-414f-96b7-e6de57c7e21d@gmail.com>
 <8979ae0b-c443-4b45-8210-6394471dddd1@kernel.dk>
 <8de221f7-fe5a-4da9-899e-de2a856a4ddc@kernel.dk>
 <yywbp7fjnwgqxvc66zimea4hgdc2eysjx5nezky3vndr7xw25l@jv76rdseqm3e>
 <b8018270-6e9a-4888-87fd-69620d62c4e5@kernel.dk>
Content-Language: en-US
In-Reply-To: <b8018270-6e9a-4888-87fd-69620d62c4e5@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/21/24 12:25 PM, Jens Axboe wrote:
> Outside of that, only other thing I can think of is that the final
> close would be punted to task_work by fput(), which means there's also
> a dependency on the task having run its kernel task_work before it's
> fully closed.

Yep I think that's it, the below should fix it.


diff --git a/io_uring/sqpoll.c b/io_uring/sqpoll.c
index 554c7212aa46..68a3e3290411 100644
--- a/io_uring/sqpoll.c
+++ b/io_uring/sqpoll.c
@@ -241,6 +241,8 @@ static unsigned int io_sq_tw(struct llist_node **retry_list, int max_entries)
 			return count;
 		max_entries -= count;
 	}
+	if (task_work_pending(current))
+		task_work_run();
 
 	*retry_list = tctx_task_work_run(tctx, max_entries, &count);
 	return count;

-- 
Jens Axboe

