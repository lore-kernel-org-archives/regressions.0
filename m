Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE3E1DE4EF
	for <regressions@lists.linux.dev>; Wed,  6 Nov 2024 17:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730913205; cv=none; b=kZ3qt71xiYt/18KneOR+LtNt9mLd22ZNO0URrzW879ZAnuTR5lROEzT8V5D3PEE8BFNXPPoTUS1sbKwqpsCKDBoq0yROpzw1uVmUZLR7cH0sRn0usEsLv4G97WoGJsjWXcTFuKmyKG5aJMjw4+uO4YmiIn7kmQKE3stmfSijrCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730913205; c=relaxed/simple;
	bh=GeT/ouLOVoC2s9nj/5tQta0zJnVlEmaEpYa8KKsfByQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GekF/8rZBEz7+tq3+d7KRvH/JDjYl3Bvug3JJeSzYWNwkQb5Pb7eN+zVLy8VNaXfpCSaUDZe2R6YbPMrxSmnG4/m3c9LmejsfqgblUqwy0IdaozmOrdb8tBWvY2MBz0me91atHOiaQtwwb9LF6UBPONjgojLUyWP2DVjUowtaJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuY8kTu3; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuY8kTu3"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9ed49ec0f1so2654566b.1
        for <regressions@lists.linux.dev>; Wed, 06 Nov 2024 09:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730913202; x=1731518002; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0+0NV766Seivxun/LuESlqO5hEIVKRYjpFjWMZJ1o3U=;
        b=LuY8kTu3L/X52bggb+sutj1yw1a1Z16eMidAHw6fm5aeXqKUZ6VQ9KDGry2K0x8OL4
         v8FejiPV++c/66dUTGBYQYzmRChP34y0FTMue22466GCP/77gDpxrThlWOmHVI/7Dg5L
         Pr3bj3JOMQGD0huvcn/lbjlhphoSdiBXg2vtf/FCpmwyWGcbTMUs3Chx9k08oFHaPflN
         oCXnD252mXURoM8v2zLFcw7KjGzi9m2N+wksBhAxNBqreT3HkG37I6ZGi5A3yEh7CDNf
         5xPJRxVS+Ch37sZMzI64e3rKVf+J5j+8MX7Zj/ApJW8fnx0+XRuhFMfRmhz8KvH8J4yn
         8wAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730913202; x=1731518002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+0NV766Seivxun/LuESlqO5hEIVKRYjpFjWMZJ1o3U=;
        b=E2IUlH3W3pJdNvIsg13sIOJxQryjPJLMdW1PKi29P8y8AiFcTYmQbupaU58ZP2MXVG
         QUedMiEi46D0NNyxQc4HgNTa/WWbIeWECoxwUsJq7BhscEO0UlxeCzDcSYVU/XajkQkB
         Sne6qu7dhIY7WNg5h5ysf6HqrkHVfLkf/EQzQLX7BmTkt6DkBPi52ujcBaNQ+WnFwB0K
         GS7GrafBid4fUM2FgSKioGIYuJNPWZOafJHDwi7o6+tNiIDu/cNBYrM8o9HIeljbiRU8
         pt+2I40NQyfy/b8p/YNA8bSoli11MByqVTX1JCvUOXVn6ZbQa4NqScphPe+IDXKeCSUt
         EFfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUqos/dViXPSM6RMgZNeMCoJJQ2/9Ziyt0l6Yu86N4m4c9pO/9pNyeUEDq/RS4ukIGG9d8wzTvrVvUkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YztW6pZIS9zn/mfjfxCHGF2M9+FXCkYwMqxDADNVUCF2A0WeP6L
	K/jEJTWONIG5uVzzlMgjfnpqfXf9Y7TdFh67JRejhvJMSo71mssUTeE1Bhg+/1Dzjb5rcgNgUO3
	MYY7TVnzDs7Cg0VVbFMpm54oO410=
X-Google-Smtp-Source: AGHT+IFKdlzQTW4jQ3GFsSu1Zw5ZOVnsPZS7hjhlQmQw63nhSPZ9mGpqdPOZSixgrowSISMuOt+RSwI65pvIrNu8j9g=
X-Received: by 2002:a17:907:94cb:b0:a99:e59a:1931 with SMTP id
 a640c23a62f3a-a9e3a7f0618mr2972355066b.53.1730913201695; Wed, 06 Nov 2024
 09:13:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <60f752e8-787e-44a8-92ae-48bdfc9b43e7@app.fastmail.com> <87wmhg61yp.fsf@kernel.org>
In-Reply-To: <87wmhg61yp.fsf@kernel.org>
From: Andrey Batyiev <batyiev@gmail.com>
Date: Wed, 6 Nov 2024 19:13:17 +0200
Message-ID: <CAEQQxWx7PXw3O_j1FWn7G+DhUUXt3sEB0qDyA2+udRQ6r28FUA@mail.gmail.com>
Subject: Re: [REGRESSION] The iwl4965 driver broke somewhere between 6.10.10
 and 6.11.5 (probably 6.11rc)
To: Kalle Valo <kvalo@kernel.org>
Cc: Alf Marius <post@alfmarius.net>, regressions@lists.linux.dev, 
	linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

I've only tested it on my 3945. I have no equipment to test it on 4965, sorry.

Regards,
   Andrii
