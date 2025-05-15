Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B67B664
	for <regressions@lists.linux.dev>; Thu, 15 May 2025 21:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747345159; cv=none; b=kAxrll3imONdcNiDutPdYHMRS3b8wcU24EGhx3KY2OxTu3PKdMg6CQ+LC1xqRcNvvV79yJ0lS11YKI5zaqdq072G1wnSF1IW/MqSKAaimDAbqa8cW5Kj4qHqfbrtC/xlj0NkSGPPrH8ccaTx+ALcqONS8gapOzSSaj+AIdCvXLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747345159; c=relaxed/simple;
	bh=XLjz8gJZUesCCRUYEuMqFQ7rRJFtNdWciD6tOyLP8lA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GqX0gN7YpuFTzsN2ywfKovbfplTUd1lrrERRApXcfIl2PQFL/F8Df0v3+tMgK7kbGYkP2zSHRkJdBiZmWUWb7uZQb6tYq9Rr8DzcNbql4TsRUgV/KkjH8n551pxTVg6EJ2b3wIpGF49pT6rb4bO5sLgJKHKa2eSLk95xFaZ39xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nvz3cs7r; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nvz3cs7r"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so1350463a91.3
        for <regressions@lists.linux.dev>; Thu, 15 May 2025 14:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747345157; x=1747949957; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XLjz8gJZUesCCRUYEuMqFQ7rRJFtNdWciD6tOyLP8lA=;
        b=Nvz3cs7rwDW3fpa7ozsaLhnMJ//FrkBYeWaj4JWoaUnRgGrvgZRu/XW/0qhAMlu+m7
         8SiMqtfaXaqQwp9NMEqNvzo9tY/EXzCC5O760iIfeJxgbik9IZYLkTPNFgfZQAH7oJG7
         4fjOEaU3z5xRVjUnI2j9N3uDoaxYTurCAsA3B/LvvmmmM1XxXqRjIoMWwiWO/maox0ip
         1ZMLI1nGvdAlUQttZpQfe4aXWAQpMu75fgnywKg9fj8crlikIQvZ1hDVgJgLV1ofBHIi
         XMT7IY/h62iweeEYM78JN9aSknLOnF9EfyRoYSjsOgfLdqLOLWZUeqhYJ3j6tSG4gLCu
         PqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747345157; x=1747949957;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XLjz8gJZUesCCRUYEuMqFQ7rRJFtNdWciD6tOyLP8lA=;
        b=L0LnW8vKHVf5YSfKQiUsdfFLka6gPcRrmKhPdeD8GOB2P+4uz6DbhqnlqKA1AORjoi
         PnvqdTI/2r+jJPIa3gY7gwpPklnSAfFO+e+MXIY4MfoNCnws0ZSK1+YvX6J1OjIhes8n
         nu+zmZj1Ujv61rE2rZL7Hf9YosCXihs+r14IdQC/NB1KLeSHqOi2ecjwSCY6yRsbz+cO
         v9vxWjxuSlNs6BiTLInQzfX2jpXSRvRfcaW6HGtyrNWJq6qSb3ZsAlIBZyQ4bgEQB9Lo
         KMJclusOptNiyip8275cBwITp2nEq+xLzr7JT/I7KLGBBK5RaTemvo9yZyQtT98kzdnE
         6Xxw==
X-Forwarded-Encrypted: i=1; AJvYcCWPdk+W9tSfDjC/wBKfYPhlrsxe4dYCKzFVqHIyXikXVHNSUjNJbgJoPHugITrlfxkRe4jhwqkfr4dzBg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAyw8zVUwVhOOGhcc2HtuSGjCgPCmQ8IbeSLiWEZV5oW4Z+IYi
	lma1UkjFha+1SSbbijiw2TKOAd+XQgSPh41sr1L/nGfjVrRE4YspxZx3
X-Gm-Gg: ASbGncureBptaCCyGDB2Q2nplcYpQ+3UeQ1vhI4sws7WpvzET5HYDjcXFuCY9qjguOa
	/ox2haYthiWuOvW9mXHzwRvE/QeGQ6ETaa05jH7/8kEzs3nIZHGLVchuvl12/J+gSN6rNRdt7W/
	tRKL59ltDdKZGoCg3G1rYIjHwshvCerLbWwhaupUeFoRjtzZE0eLdNo2xBgHpHRI59V5ddO6+tA
	WSST2oWzLBR6g52Nf2CpLUPUtHiqZ243zbZIXveqoCBJhMhHE5t3L9s+/kXnnifZbODkB9xpG+S
	NeNi923Ad/Sovv7AkxgbLeZSRRx/5V0SK0SnZzKVeQGWHfs=
X-Google-Smtp-Source: AGHT+IFJqucu55xwtaxuHQzfFV/gJjZGnpp0tvXJvbw+T1Fs0ayZCl8h/rq1RQyoE1z30b0ZtoMYgg==
X-Received: by 2002:a17:90b:184d:b0:2ee:e317:69ab with SMTP id 98e67ed59e1d1-30e7d2fda18mr1694038a91.0.1747345157045;
        Thu, 15 May 2025 14:39:17 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf700e6sm371106a12.29.2025.05.15.14.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 14:39:16 -0700 (PDT)
Message-ID: <73abd7d20395a02b6664ea5ceacb46c530da3b2e.camel@gmail.com>
Subject: Re: [REGRESSION] bpf verifier slowdown due to vrealloc() change
 since 6.15-rc6
From: Eduard Zingerman <eddyz87@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Shung-Hsi Yu <shung-hsi.yu@suse.com>, bpf@vger.kernel.org, 
	linux-mm@kvack.org, Andrii Nakryiko <andrii@kernel.org>, Ihor Solodrai	
 <ihor.solodrai@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>,
 Uladzislau Rezki <urezki@gmail.com>, 	linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, 	regressions@lists.linux.dev, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  Alexei Starovoitov	
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Pawan Gupta	
 <pawan.kumar.gupta@linux.intel.com>
Date: Thu, 15 May 2025 14:39:14 -0700
In-Reply-To: <202505151435.ECC98E09@keescook>
References: 
	<20250515-bpf-verifier-slowdown-vwo2meju4cgp2su5ckj@6gi6ssxbnfqg>
	 <202505150845.0F9E154@keescook>
	 <c36245a48149a12180ec710c65d317a12cdfa020.camel@gmail.com>
	 <202505151435.ECC98E09@keescook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2025-05-15 at 14:36 -0700, Kees Cook wrote:

[...]

> Well that's pretty definitive! Thank you! I'll send out a properly
> formatted patch. May I add your Tested-by?

Sure, thank you.

