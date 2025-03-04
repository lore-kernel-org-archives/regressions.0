Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1429717BEB6
	for <regressions@lists.linux.dev>; Tue,  4 Mar 2025 10:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084409; cv=none; b=q4QpfOt6hnUy9AV6D+mtMGPPnrVMjH10Rtoj/rI3fmxRHgfwBY/9D8EGLiJUzh/vETR3DosaY+6cDGDC92pf6whi03WRSUkRJ8NvgweAXim5fwzoEZn6Du4e6DfEWYBEd92KCmEQgq5haFkJzEahSRA8HqPGq2usT9CVc8+VGEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084409; c=relaxed/simple;
	bh=XYQO0aGcai5r/Etb8m+HZhlol7Bo0XWaJF+1VWhGLJM=;
	h=Message-ID:Date:MIME-Version:To:From:Cc:Subject:Content-Type; b=EHcE7l6lxG8ZjAnwtPrNH1F2Cth9CaAqFWTMD5uPAipK7jO1gDwCzPtwbOBg4NhAYHN9Z304N3CFJOZx/8JBu9cam4jk0RDCy1t6AJMGEPWyK2c4/PIwouZJKFoTqR+ONTOtEkNTZeT2crtBxn9XX55+44AAHkNACQ+4GDYwu0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=swine.de; spf=pass smtp.mailfrom=swine.de; dkim=pass (2048-bit key) header.d=swine.de header.i=@swine.de header.b=nZyzlSSg; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=swine.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swine.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=swine.de header.i=@swine.de header.b="nZyzlSSg"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3910f525165so1415494f8f.1
        for <regressions@lists.linux.dev>; Tue, 04 Mar 2025 02:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=swine.de; s=google; t=1741084406; x=1741689206; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:cc:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYQO0aGcai5r/Etb8m+HZhlol7Bo0XWaJF+1VWhGLJM=;
        b=nZyzlSSgNSZR2ckDx2YGCKGumWQEHhgnPYF2nI/qkkOKULOo+BqJQfdlERkrZKPmJc
         NMS+Eexu09qgiG8zAhanZB4LlXrXuaWPSmRsUfkGVpA2WiyC+sZGn54wAQp+1FgxTz33
         tQ94ZQQ9Y21FjdjfYZf5xTS3Z+nac8N/9gvvYW4RJP2jKQ4HM/OhBVsYWL9KZWfkOS9p
         C0ciUyYRMpzKHCQt54yFt8JErMxXHeT5FNMU0pti1VxglZtiRYAqNrCuvfuwpuIa6qr4
         xpEkKmSws5OFu9NrEpenAxoXHRk7bo4hz38vH+RZld4o5A/PKnQjftptedN63Bs5u7kX
         9lIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084406; x=1741689206;
        h=content-transfer-encoding:subject:cc:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XYQO0aGcai5r/Etb8m+HZhlol7Bo0XWaJF+1VWhGLJM=;
        b=IFuvrEzFiezSTpJC9YiVkqLxbqnBUIbrHu55OL3WwWqUHPC+W65eLxsEG65kE5zkDY
         MT55r2ZSWnL4GzoNPXr/Nhx2mxdh29/EmokFBAidxrh7N+Exh2fcfQpZNcoNz5cSNB5q
         wqYG6vt0ipGFDDHR3/pCLOGVGekPETFZrF2JVphdiUqJNmSFVAVNHusoUJXhH6zoSvmI
         kWAP060EBlCu60Legrb0iVuvFdGb6RCykHiav+wpCN2q4SDku8ydNo+ZpjLFCVj2XUvc
         h+jNgUGxai8iukEntI/jPOj5HkqAjkaz87TN+EfM4Y2PErvzJKOgYTGhRKqErXDEb4s/
         93hA==
X-Gm-Message-State: AOJu0YwqjmP+rYGttqMKnG6VX0XrWlrbwRgZ1ORGKQ2dG0K7K8c+J3KY
	EYyy2yyoE6tEvx9kEuVB8/Q8GfYccNuz4vu14Xn6tftjjYUwPHp2IdoyTFPatfw=
X-Gm-Gg: ASbGncsikBQDRXpr6YnC+YywwcO9RdQmTAwY5Tl7Ewz6cTkzQmu/6enBoMG3jbpAaSH
	M9xbcpZFYR40DxoB552X0GNK97YMvSKP8ir8BDFj/lxs8qSVVYOYEKQZ3nP50rCX442Yd9f7cOp
	pzaC235BxIMbcg6T4XJOb15MZ6Ujnr5A7X+hi5YT0eJxe10ra07F1M70jgFvrAgrrCCPoACX6x9
	BDJfu41MBR4OGTdTwYZ2c/bG2xCZM/FM1aNK83md2AdQnAtPJBC2SHvZXAjNk8Yx+pkJ7WeTIHZ
	tHUb3LGJ0kyj4dzyUYA906JO6y2Knyw3bOr/OGAkq63HWB1Xg1JE7OCgiFsWOjQoAigFLHr364M
	U35MI4wNJeaY1QU+CSM+NoojvL0EBUg==
X-Google-Smtp-Source: AGHT+IGVMZo6vZ+6m+6BM/f63VhKf7ZZ84g2yeayp4xyDuWaoA5bfrmXVVwime6pCBYd6DiG2wMFmw==
X-Received: by 2002:a05:6000:2a1:b0:391:ae6:1312 with SMTP id ffacd0b85a97d-3910ae613e9mr6437829f8f.45.1741084405983;
        Tue, 04 Mar 2025 02:33:25 -0800 (PST)
Received: from ?IPV6:2a02:6b67:d118:f400:3597:9f03:622b:da8b? ([2a02:6b67:d118:f400:3597:9f03:622b:da8b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4847e62sm17441453f8f.67.2025.03.04.02.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 02:33:25 -0800 (PST)
Message-ID: <f32da38f-d313-48ed-9ca6-7da210b08f8b@swine.de>
Date: Tue, 4 Mar 2025 10:33:24 +0000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: stable@vger.kernel.org
From: Christian Simon <simon@swine.de>
Cc: regressions@lists.linux.dev, jolsa@kernel.org
Subject: [6.1.y][6.6.y] uprobes: Fix race in uprobe_free_utask
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear stable team,

I noticed that cfa7f3d2c526 ("perf,x86: avoid missing caller address in stack traces captured in uprobe"), got backported into 6.1.113 and 6.6.55, but it contains a race condition which Jiri Olsa has fixed in mainline b583ef82b671 ("uprobes: Fix race in uprobe_free_utask"). I think this should be backported into those stable branches.

#regzbot title: uprobes: Fix race in uprobe_free_utask
#regzbot introduced: cfa7f3d2c526
#regzbot link: https://lore.kernel.org/all/20250109141440.2692173-1-jolsa@kernel.org/

Link: https://lore.kernel.org/all/20250109141440.2692173-1-jolsa@kernel.org/

Note: Sorry if I am using the wrong process/form/format, I tried to follow "Option 2" from the stable-kernel-rules.html.

Best regards,
Christian



