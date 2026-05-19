Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A3C320A04
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 02:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779158361; cv=none; b=mTy7lC/myzpbnT+12oKmKTBSnGUVUi6mWkSsjrsEeRCq6528wnPsoGhFo8mshgurKdQlT11KGWLx8KqEXR6YZI1U3TPsbsPeisAYUr4rEO487AjM8WHivrcmvf/25yyNzk5yzYnTNbZlSFwqnh0hxvlmwzMvsM7Cervulu1wmqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779158361; c=relaxed/simple;
	bh=axEuloCdAkJ7kANTevQ4Aav031O1vXQ9XvXVtXqtJ/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ENPZYX1jjaGEvXsf0pXsXI8aID5hlsSb01nLDGNwRSMJczdB07HD8ovmHkc7Xt8ZsqJ2H5MY34MFMovqBQNTdZ5OVxjUQw6nzBI5wNJDOEGGB6QWPDTbsy3TFxaZYBlUoMMSOr68NgJ3csbhqZQE8ro1NkgBsmCHOQ4gjn+5h7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgW5J19J; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgW5J19J"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1309f4ee97fso3307081c88.1
        for <regressions@lists.linux.dev>; Mon, 18 May 2026 19:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779158359; x=1779763159; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=axEuloCdAkJ7kANTevQ4Aav031O1vXQ9XvXVtXqtJ/Y=;
        b=mgW5J19JErsctYki6yYJN+kXIBbkh2ktPKzvm6oc6pPgZZjWzpy1NmIBn8/dW+Crlm
         pZX3o66ruFpKgqPhbTn9lzO9AcnaAaMmsDxzwcbTD0WRmkkOcYwI1cVgy+RDOx22BMdp
         BmzwcIACwzNTar17nukwF+uJKjqQmLX5hom2S9PgWG0tfgek6Z5eQDbQ7keC0XP7Yeb6
         Skq0Gd9UHAUAMmuWQGUyBkkFgEn+qFlLbdNOWFbgFO8ZN8ujZeW7t3pBOpyo+1uTZOOk
         uKeeKz1KrwhCm192vB3PWLXRdL/5cvEB/IH3E4QYRaUdxmnD2VdfxB+9cFQ9q7MlqjF7
         O2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779158359; x=1779763159;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axEuloCdAkJ7kANTevQ4Aav031O1vXQ9XvXVtXqtJ/Y=;
        b=cMTpwZdgOd0QhUGKk67Xbyf6lDodu5nH0KoDZHItXnjC1rz9lY5514/JH/5dS+6GS2
         QnBBXPYRAhkYTzeObILHEdpixtjB53oSynM7VEVVewlWwZBkuEzrOG/78DBijGGfYYcD
         fTzO6om830YWdcGpYgaokO4kPsCMQSjB/VNNToq5eNEB4MtFMd/93oWFQDPUvPTF/cB8
         YQaadFvDkOWApUv2esRAWR7pMNRi24RrxCMtGkGFHhSFM53G4lGsI0Hq3VuxNLrIeHaS
         q8VbhAC/F06ff9cl2sNJ5pjKLzv1tnNd3nkPCmB7fHzFsEIwDg+04WyCn+IZHL37i1ca
         cTXA==
X-Forwarded-Encrypted: i=1; AFNElJ/jwEbuwZbCmHy5ogftUEaC79GXOTPiXtQAjdA3XHIic1QtajraaZHywSSKjEQKl0XMiJSxdJuxHfQpYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxytzsLAhefhwbdXh2y7moNI+NY8GGECosQAu4r+ruXsDVjkP6Q
	XE4AuIRL0UNx3m6dT1NnqhMsFPWFghjYVWLZ/CfXrL4/eTGq/xLsXD0B
X-Gm-Gg: Acq92OGA/ZdiaQ+HlZicM9Ww8bFvnK9QUGF6LmBqS7r0qfAcz3/kvSUc1aHphsQuUs2
	loXyxQRkWUb5fOfOrcZWp4MHW0uF8DIfbHR4X1LG7kseFK7Wxm9f1hHL4RM1q+hewZP9nJ7MUZJ
	hxpgXSOp5lGA1/vUAgHW+WfKxtc/F0CgnrNaFledVqMyG270WxHjcX/ZnD3jVvyPYm+vMR/6pRW
	L/eBrQQExGXdN+WXSMiqn/VBQ50asosIoJuURUxw4ZvgkARK/JhxXxTFXn0MhkdgA9A38Vn9Wyu
	qP6r/SteJQcPrWZbBH+KvQT4BWGu7SM9NqTlNKDgwOrx9LchifnFgUCZ83ZBDvHOrbvTQg3pLHN
	S/2sm9RzWhq/gJxwWk/t75ul0/ybj/vwMZqk0PnbTkRr3ZVdYrJ1cJWg18T8rNob0Zt6YfyZbj/
	tITjm0a48bvZEEjleJuVJGnwMs2fymbA==
X-Received: by 2002:a05:693c:2c8d:b0:2ed:e14:7f54 with SMTP id 5a478bee46e88-303986c4e76mr7839552eec.30.1779158358972;
        Mon, 18 May 2026 19:39:18 -0700 (PDT)
Received: from [192.168.21.192] ([67.170.89.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978afdd3sm15417143eec.29.2026.05.18.19.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 19:39:18 -0700 (PDT)
Message-ID: <f87eb942-425e-466e-99cf-f04a0503991f@gmail.com>
Date: Mon, 18 May 2026 19:39:17 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH 1/1] sparc64: Fix tick/stick comparator equal-compare
 hazard
Content-Language: en-US
To: davem@davemloft.net, sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, andreas@gaisler.com, tglx@kernel.org,
 thomas.weissschuh@linutronix.de, regressions@lists.linux.dev,
 glaubitz@physik.fu-berlin.de, linux@leemhuis.info,
 torvalds@linux-foundation.org
References: <20260518235632.5122-1-unixpro1970@gmail.com>
 <20260518235632.5122-2-unixpro1970@gmail.com>
From: Tony Rodriguez <unixpro1970@gmail.com>
In-Reply-To: <20260518235632.5122-2-unixpro1970@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Created a new patch regarding this topic.

Please see:

https://lore.kernel.org/all/20260519022421.5978-2-unixpro1970@gmail.com/

https://lore.kernel.org/all/20260519022421.5978-1-unixpro1970@gmail.com/

