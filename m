Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795662997;
	b=sfI06v141rZc2sjLc5MXy07rQTgWGjX0I77umqXA9Irem4FA3qEs3+JzOPcrHWOu7dn1
	 8rGSYs+IDZmya2YcPx9XYtzwC+9Os1bAQIbPXNOzom1w9FXDI4o/ZWdtJPaiuiT76Izoj
	 QPzKeJKOl7PzDw5h21x7XPDfAZIYqSwZoFhumu/gjznhaL/rTuffTpi2wmTlPGE/7nNAe
	 gKFNnpQOsSRLwPI8CFyMyIKNoWictFM/NjvGqEKCXjlUJopVS9OlmGYxHlz573lWO2X10
	 LC75ZL/RXr9/t6HmLpox6B+pfpWeusq/zy/5YZaUuozbG8xtDuzvOFVe0RshQ8gYdrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tcooh5ifHPPkIJoD1PmC/XnuN3ZG+rWbfWXyKgveikk=;
	b=wLrimuOOTUqJDlz6iZryESyT9ram+bHvbVtJWdS3RlZQV7PFHopMIqX5L8B9GyrVMdlE
	 eBFOmXSc9CSLNYL8QVnm4n7CxAH7EHcFv7D/81JonPZ7zkcp0unyKq2uOw9DL1FpSLfA4
	 JuWfJ0sacyhFgSFeDY6AlTE68M0Pm6AWkVDXJ5q967ovtcmNhWw8TDdldrzB7oUqm8hUA
	 hXIvwYv++l3gHLdav5asLGDzkhNO/6yoXTDHqg7lv4EZK/zvE5Hj8hHdS58ULKMR0sKUa
	 sZr0ps2SMlK8FIOZL1Q7uFHGep9jFMikRwQfL/l8JwW6rek3+avNCgoHir3o7IOogSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0l5yU49S;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25AF606A31E
	for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 03:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A25AF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0l5yU49S
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso3709693f8f.1
        for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 19:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662995; x=1796267795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcooh5ifHPPkIJoD1PmC/XnuN3ZG+rWbfWXyKgveikk=;
        b=0l5yU49SfX+c7cI+v3c0ang0X08ASWuEieq3tsqSfi3CASH6OVzm9EtssDA09M4l5u
         oT1J0kHd+zMqqoX1gmLoanFZGlcgEHAgV7bdZWTGNDM+HFEluH4nU+zzK2IgSzVXUol7
         Ll9GhcBV4ftC0m9ESXAfAVUEbPY1zcZ4uCrzdYnzM8NaGBubyIyDaPm0gRvfLw4L4U67
         LbSKNcnC6o+PEAm+2TlZVEr/O07sti7Iua5aunC3jIukIqHui8SpHNMWaBlWp5EKDpXU
         avlgYkWqTGvLt4Zong8hveGSp3W2Rdbz3FHnHTFg5EoX2g6ZvHI9Cod6dkDRWEHPut4Q
         9YdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662995; x=1796267795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tcooh5ifHPPkIJoD1PmC/XnuN3ZG+rWbfWXyKgveikk=;
        b=Utctwg0+KRvIw6umOxpZMprydR71g0FyTC5SgDhIjgc1CdObOBjjD6NPjtx6/6QdPJ
         QR1EICGK0BjV2G00yY+QYrB5b3t0myMXeBKFc5wqjYe2spDq/145fDroygeU0vYC+r3Z
         BuNxc3E0VK304V3sBvRnXIDlFGntVFz9iTUjrsPpZ622J3JGpSNy601xyeY9Bn2Hvy+x
         6cw+6ld0LcTq/3tBg9Sa2QsLm32Kww6FzmsdhVr/SpeCvVS0flrQMGZ0Y8AtRG2w0D62
         /Wm3fS8r4kUiKS8iLtBoiY4d0tiz8Eb3Np8BIESq5S77FtX2Q4vgiqLxaL7ZbF6R0/IS
         nZJQ==
X-Gm-Message-State: APuU4Z+4JZa3FyyQ3kYZ4WHTb7FGjq8hROlzH63kql6LO23DmoNr3+aX
	p7TOKK3H1WQeY0EQ3f5fvHnGHuI8PxHrJhceR8FwjGci3YEVojTyRSD4jbnHvJ4aljw=
X-Gm-Gg: AZFdTZdBg8qfiQ6jF0zsawYPT4HXlDaG+1+DW5osoZEZaQTOXzoiduGr4VQOz/JtGOL
	gz/fWgj39G7HEUm4dN3phhFL3OXkzuM6WxQvsUdXUpALV0m6U7NAkPfHknT5YS6K/1OrT/5wOcO
	KzIiJDeWFPylJdLq9ROBqjI35VxyYGstAGjRLg2ZcRQw37N8KMrHau9jkzlUHLhUqj4+ztBeQud
	uW2fS/EF1Jr8vE05OWkHfmaiXB9dI/Ls64IPvt+qa2H8zSSbP2LvvoNM4lF16hmhe04pJSugvvy
	OgVBGAPC8wVY411RWhErpJRLMK15qOJWT7tYPuWVO1oWW5oLdl/zURB3Iq4l+8KrEnZ/mYhy5US
	VCH6GTdsAmJHvJsXRFutDj8DtOCIlv2aDOBolslQ6YO3SUy5ishF54hP7/0IB1zPWyUdrkQthPr
	oQwOC3T9JVXshkCPh47Y4QaZKUaFv7Z3OXI6iUUuSlOT/so61stM+fLYYZLkSTIWiTySYrK1DF4
	FHiFLDggllosDZhs/jm/W+h7yspE9FlsKA+FsTY2d7++iFkJYyADFBOEcN2F7pT8ZAE1bES2EX5
	EwwCN4alOoY4dxfqgCWo6cqtQO59XPGf0L5xxUOvcbXLP//iPcLdMuhr4s9YWsRaU660s8q4Fis
	NIqRWLSMNIL9koIzvPsDjzwcU6svkR2JMhBmHjctMXQ9rYaj7qaSvpAi5Pbu9HrV7h/04UHNq3f
	KL0yVBevjVHA+y
X-Received: by 2002:a05:6000:26ca:b0:4a7:1fca:e52b with SMTP id ffacd0b85a97d-4abb0e469damr39967504f8f.19.1795662995002;
        Wed, 25 Nov 2026 19:16:35 -0800 (PST)
Received: from localhost.localdomain ([31.223.101.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm43323619f8f.55.2026.11.25.19.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:16:34 -0800 (PST)
From: Oguzhan KAYNAK <kaynak.oguzhan0@gmail.com>
To: regressions@lists.linux.dev
Cc: ntb@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>
Subject: Re: [PATCH] ntb: ntb_tool: accept hexadecimal addresses in peer_mw_trans again
Date: Thu, 26 Nov 2026 06:16:25 +0300
Message-Id: <20261126031625.166614-1-kaynak.oguzhan0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126031506.165973-1-kaynak.oguzhan0@gmail.com>
References: <20261126031506.165973-1-kaynak.oguzhan0@gmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#regzbot introduced: 21fbdc4d0b1e
