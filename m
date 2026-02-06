Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B426A330D54
	for <regressions@lists.linux.dev>; Fri,  6 Feb 2026 11:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770377607; cv=pass; b=IMKuyGEdlU8amj3X/TKmxquuFX35kvUDN5M0AqEUB6clfZgSragUW3semnWBVgs9lwU9OHQko/yLpuUMwgmkWFHjQ3GOHkZHan6+wn3mjKAfgKe2Lup6k2oIKZaz6kVGRqVPZlcqqCeWAoTpKFwhQdHRbBN21gMYLs+KbBRANMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770377607; c=relaxed/simple;
	bh=a5AhwyPYptqScX5CvISb2ra9HKM7W9Bj9nC5ICah3VU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SDlCaWQdyFxVnuyHCUofdzKrSAriMcYWF0P+gCAvKb2b0ijPVIJW1rv84GMxrcndDDe+nxSpa//C2quWWEHlV39L5lphvJqGUKMgPwzC4MeNL4EBSnjRygA+fMAANZvWi4l2KN/J+PAYRWKSjYzS1kwJdeelU+2QnOy1bj5nIKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eb4GJHrx; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eb4GJHrx"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43628a01c32so444788f8f.0
        for <regressions@lists.linux.dev>; Fri, 06 Feb 2026 03:33:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770377605; cv=none;
        d=google.com; s=arc-20240605;
        b=U0xy03Vb6pCrFVls+g8R3e5heUSknegwIeGY30yF4fWi4xmAqakKZ/tVTwY7xqKJq1
         55QHNTMU97K9iNUiH55rPAq9LFvBeyJpiel4OVnLMhllAn9cdiMTa6ZPyskaOjE6QVpi
         AW8fCH+N+W/137AMcjfV4SaH7/WCiQQJF9IiFJvGgK2lnUFxExBhhosbVPeKdZ1rsFTk
         m6xO/9Vf7qaX4o4KCn1mM6WEZz97RDq5IW94Y0YqHE8rf7MAYbjf7f1L6/8rnlc4hY5l
         /x1RcKudQl3hgRt4MUE5o1ezmRMRSFQ3Th0TZ+6afJzXvhYau8P8C2oYMGjlZCOFrFVj
         ES7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qYdH/hNC/UeCB6NgJcX7BWXr9w94Q515Os8NJ0f+PW8=;
        fh=lurHPBN5vny8LQ5Sv+o5LEL+lBwaqSOVoBXYBD3LcNo=;
        b=FjCBi1sCdzVCpxvT1Oo3bKaWUx6CjLYmbyFJPpHaGTKG2GOH2+EyLWQq+gzLBs/w6L
         zKDoK+o747fesPajEINWLNculNDzpE3rRsWYtkbETgVynew30QwwGUyzs14SU4Ja1Dvl
         6Yyird58FbcGtuBNs5SVEkbniokCCAT2dLdQYN+UpS/rvTwxA56z1FfmkxWyvWcmPZcr
         h2NQEDtdv7/mA6wqEqFHfgAcrEfeR8X3KV2XHDoSZeXBWdcwpm+ovDtYmXeNVb9Y7VBm
         mtnr9iSY7g0YHFqjp+OT6dREaEQOuoyVARacnY0OEHuW/rxmlRfH0lFxk4B1ezJ2xlv7
         q1Vw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770377605; x=1770982405; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qYdH/hNC/UeCB6NgJcX7BWXr9w94Q515Os8NJ0f+PW8=;
        b=Eb4GJHrxKY2BJwd3g/DzP8HpMN6Pueg9UCDUMP2yl7X7jdN4pqGEWrp12UFROwDFqa
         W5nTeGMl9RfrH6kXVCYKSnagsQLkarlobKOuyV8yJarqb4MFrsejafh37Y7lCfgeQS8y
         MIgslyQJ2DbabQ+feUxtG28TRJZ9jV8JiyCvhc740QKG4LWlSvtAB/W74ahUMtTBOcnB
         bVHQvfBpXmXiyMmcWCEUUjMBGP8KTJ63sQBbHnwsdlABxzoNM+q8bXTeYefLq7rJWQr3
         nsxbqzB14TXehuNtS4WgcO2saByVK6m42ccH5CAkLCn5tU8cg8dfG+jZzLUqCmCGHQiy
         gJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770377605; x=1770982405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYdH/hNC/UeCB6NgJcX7BWXr9w94Q515Os8NJ0f+PW8=;
        b=BaR2kcH1MZn3QSV+w1nVN8LC/PXzeXVkai+5WAL+MKPEahOqEO+UO+08b8duhnjvxa
         ay6zEupB5Qaz3REoadWdlcMmoz2TfoYvvbE2t3IAvMSqtZIf8JC5hIFyK43W43zPVhDm
         0yUJbJxowUx/+HJGrPUDOb9BTX1sKXs/x1qY0QNBPIxF0HeqCiKwWEMOC3nxDi7w9A6r
         9JypXcXVCsFtsu4EeyZIJ0G/Fi28t+l5osoGPIx+iJZ/nonxqP45mPU6FZb9VDdtMofO
         0T01ytTMi5Y7utQ05jEAiODfUqFZnQSCzGmtkUuGKPA5yemn7TOfZGhAMjskr913HTVk
         XqOw==
X-Forwarded-Encrypted: i=1; AJvYcCXK2jL5eUDAaPnjIy8X6VAtg/OQv5/RWSpAh2SqyYOzqODMUAwGgHNgicPBNrA2qjvHW8ywSbeyRSp2MA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzlkwQangm8Pvos2+9fezMmf0Gk4fV9S5edo8KM+jLPRW2nuwUW
	waHG36cAm6dTSbEYt9f3taFcCoblKkQp2JIWlkahM+z8aItkZUKnZAuW1Gq0uIOdFc+vc0uoeik
	5kKYHAPEgivulc0PEuEM6QbhVOa58glo=
X-Gm-Gg: AZuq6aJUoQ6RroJf7CConNNsFh5iVd7S9+ODXgbZf1bwFF41ViVg32KfwtEhp2efzJI
	cgppLZPXM85q2mEzXC5z5lG7i+/arJwCOpK1I7ECMyg8Lk03KIY33LXgVbacnr7+FqaRmtWB371
	JtzrxUa1GslzV6rNYP0dyN8Kked2MBhhFIaJf/WC6e7MQmWAnJWRzCoGYBVW+/ZCGYIi2qPqGW2
	gBXan+Zui/ysGpd0QmFoEkHKZJzufDCGBd5vmH5UlBk40LH0Bzbhtl3CwLoL7EOLJuNd/G3
X-Received: by 2002:a05:6000:402a:b0:430:f742:fbc7 with SMTP id
 ffacd0b85a97d-43629378247mr3897162f8f.14.1770377605019; Fri, 06 Feb 2026
 03:33:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFLVeg9hwH3PbKu5rPWZWqq6yz5mRRoB9oqxDkxNRdEDLGbVBw@mail.gmail.com>
In-Reply-To: <CAFLVeg9hwH3PbKu5rPWZWqq6yz5mRRoB9oqxDkxNRdEDLGbVBw@mail.gmail.com>
From: Denis Gessert <denisgessert@gmail.com>
Date: Fri, 6 Feb 2026 12:33:13 +0100
X-Gm-Features: AZwV_Qgy195bSBwn6CrB4tPCk-toUAD-yG2nvTOPL-fTryqeOhSfKzH63qhCO78
Message-ID: <CAFLVeg_soeYV4tOYKMo6TMYOtuWWU4TFCjUTxUrVEyGcRwMz7A@mail.gmail.com>
Subject: Re: [REGRESSION] mt8183-kukui: dts: changes in dts caused display to
 no longer initialize - Was: Re: mt8183-kukui: drm/mediatek: dts: Invalid
 display hw pipeline when probing mediatek-drm
To: Thorsten Leemhuis <regressions@leemhuis.info>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Evans Jahja <evansjahja13@gmail.com>, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I found this email chain while troubleshooting why my Levovo Duet
(with the MT8183 chip) would not boot using any 6.18.* kernel.

I can confirm that on my device the current stable 6.18.8 does not
boot unless I revert the commit

commit e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6 (HEAD)
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date:   Thu Jul 24 10:39:08 2025 +0200

    arm64: dts: mediatek: mt8183: Migrate to display controller OF graph

mentioned below. With the reverted commit the device boots as intended.

PS: Apologies for the potential double-mail. My first message bounced
because it was HTML, so I am sending it again text-only. (This is my
first time on the mailing list..)

Cheers,

Denis
