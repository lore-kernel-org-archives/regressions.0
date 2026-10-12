Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5AD47ACD8
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 11:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805494; cv=pass; b=hULIBQszOhFFGfWvhtlS8Vn71ulvMODh6yUWgS6hNyZhzj9kNr59SkOGiUL7qWWU0Cq07KvJeAyKL8vEa0AzAwhrUh0WFv4ngsNeo/bIqZElu3CU7J3/9IbUv4ITX+l6biO2cppV8ofGiNQ2xrV0C5VxO7x12UKT5w585zZRhQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805494; c=relaxed/simple;
	bh=K6a+uG2V+IR5Io6i+GqIRtQTxPtGAXil8uNEAa2cL8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nH9Xutb0hDj5WVXl4KCM9VLhEdJiXrguymeQxl3sfS/RtrGoO6+4E6ufTzD6CngOPdDkKwbih0V19Pg51EQEgb0I1vcOZvhFaTl1GPx1yg+qJ71ZW08wya8sw8dKpA0yrbj9dVL2eqjplRAd4C01nfCB1M5DMXScwRC5odsHjII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz; spf=pass smtp.mailfrom=sairon.cz; dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b=LCDo/xrP; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sairon.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b="LCDo/xrP"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e87c66e556so7393955ad.0
        for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 04:44:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791805487; cv=none;
        d=google.com; s=arc-20260327;
        b=TcOmA9Gj1UZAMhAZtm1JN15eIvUtpa1Opxy/K67yGLL5ca6uIZYbNbnTMoY2sCYlPF
         HKP5M2wIJLALuzP3/xsfNIX0MPoSafSb6uYpxp/BCQO+sxAGD0cY9pnndyGrZjmW/zN9
         KgJ7Eh7l3msQEIQVo0EiO4MUkF79WBYCxDTIILeRr7nmZVYpjL4Kn1tMoUMv8rwI2itq
         b2U7b2ljtdCC12W5j5IkL1r3lwGGUX/aX4vYZfXIExo/Gu0foBLsouEADYSMrrao3TiO
         Vdx9YP/pqcLMnY/7zwhE7fnIilWtt5diDRyLssVk1MVJZyrEAvOgNoo1E5GnIf54CsgT
         nd/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K6a+uG2V+IR5Io6i+GqIRtQTxPtGAXil8uNEAa2cL8k=;
        fh=oF0/Uq/zaaQxF3dUMLsV7qnX6uCCvmacfCqUOYf9jKY=;
        b=ryYniA4tU8Htel5pvgrrwNrG9MTeps/fXkc9cfPRiZIkEDOIQddgLFT5IjgF+fl9za
         06qZifNXPc6FpOiqGy7PKkD89FoiWfJZ9ExiSAcRgrOu91fWABctDlwOTzmBaWqX1ZE6
         27gg+MnL5AUJU653WCJkKSKQ52r6SSrKMV4sFvQwYnTuOS4BvIGbJcWthcAaG6MLaXJV
         nfH8C0gpqHaBthigCDM7wImawnKmX86SXcwg6xqPCuTm6M8anLd9n3/wcVKHowxy/ZMi
         8eqfzYJ2KYtyzrmXTp8+ESLpqEclwY7kmDSksE7Q3B0cGEI6jaeVrXLnCOWewunuc24F
         S36A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sairon.cz; s=google; t=1791805487; x=1792410287; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K6a+uG2V+IR5Io6i+GqIRtQTxPtGAXil8uNEAa2cL8k=;
        b=LCDo/xrPg0LnsXYMjhPUH0oPij3fq3kACiG0T2Xq8N+ikgaBD3zTMkVFu1tDx1LWx7
         qMZdTPRWsU9IHd0DhxEheLyTc57P7rIwqYEF79YAi/97pzuLreqep+buNu9nyKC0RVi1
         xJW5GaWBATV0mj0Vvqnq0Bv+FeKbGku/1rxak88DeZdaOERxXyN+SFEOSmuj92iGW9ZX
         bsdMlgxb89S3lyLG41dQny7OA1kYQum3Ud8F4Jm6ccowwJ/dX1WpA5lZi00oUdQqwwie
         /uZ21M44sCUMyx6cjkzkBHeRk8ouogSqFuEUWV/R2awFKRPmaR/70Rn4hq9uhSq1qUdS
         k3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791805487; x=1792410287;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K6a+uG2V+IR5Io6i+GqIRtQTxPtGAXil8uNEAa2cL8k=;
        b=wz+jxxCMK23CcXR/9/Ph1kODJUMWBao8iKc+jpO3sls31Uc8fe7epfVEeVVotP+/uH
         N4Ode6NMkXeMSPXx28tNwYarxYPt2VTu26Sx4a4UEFzfJflwdEsOK8IO4A7WFy87hfVn
         lKTwafytt0U1Pgv6c+sYGqEDUafX7/G8BuYy5VSiFiTvzvkYyL22V7VlEIiGVsfUIHiW
         A26tGFUnnT7l/Nwf40aNRZwt+4zXXeXxGUzIINb37vwnvNHh9ZWwgyvuXJdbee0rTnjk
         K1u9xMYUiYVzW9TSsR22shUTBOXm7Fq/zX/veritO+00ehIf/N8g+MWy0anp+V1/8hJ/
         guEw==
X-Forwarded-Encrypted: i=1; AKwUvBxuYPoprMV6U8vNRfO4rkGPXjXRDc9txTO1dntJjiWyuyaEkZPuNj+KFX06k+1EYid9YUnyr/rMbdYzig==@lists.linux.dev
X-Gm-Message-State: AFq9FYI19C0IxjMm5Jg4xcJBL+1Gk31ZDCfgiOV2SAQTnHnn79Lz/1Bi
	3K9klXhCYSm2ft93UVhietX9zrAyvBf8OBrqGugBi1UK+R+wDY5taCCdeuGiF4DFW+CRUFLgR/k
	a0kPUn/7FC4RFY1YmgUyrIC+JKpzO4FCJuoUHeIqLoiOwqWLznjgCIKQxNQ==
X-Gm-Gg: AYBFou1LmNpsfWTyGIs1E3N0IGdBrZh6jkFrhUDGOyDe/2gpX8k5iUsJrL6xe/SChsr
	6WGfKBl1hg4Sh9W9HxjxZJxbLbvObEzEYNWzXjg651BCweUveB9OyELJOP1ZrvST7wSStp1iNdZ
	4OQr/uL63yVQlefWbAY5VeSKU3h4c/NL1npiRVSz9HgIRj+fmlS37c4bFuosU3GWeO+vXKhWW6G
	TrvFGILAoekumA9aDP4s6uMQRAvJbnOPaWnfR57pk5WruDAgRvtN5egwq5JHjdldDVWX4jp4jyH
	WKdRW5jcMU0SGUVv7Y9ENRFLACkT1E38vGSqi94ELjsdROa0yPgjjEyKyLVnX6ZN02IoLo+pFz5
	KDuwlIeuZ+G6SZWWz7kqVe1ngD+F/PPUdWacLNDWEtQMbsmgCk2CmgMlnushRclpr8XJR48CjQ0
	c=
X-Received: by 2002:a17:903:3885:b0:2e7:ff36:c4d1 with SMTP id
 d9443c01a7336-2e840517a80mr65819775ad.31.1791805485551; Mon, 12 Oct 2026
 04:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPa5EdCj3v17tB-SF2JNecq5Q8s1Pranr-XzAFWNpNTBPgPG7w@mail.gmail.com>
In-Reply-To: <CAPa5EdCj3v17tB-SF2JNecq5Q8s1Pranr-XzAFWNpNTBPgPG7w@mail.gmail.com>
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
Date: Mon, 12 Oct 2026 13:44:19 +0200
X-Gm-Features: AclHuK9deDiVZ9f5xu6gGTRgmzdiz6FT9YboEHc7TBFHIaXDKq-IUEmQQbcQAvY
Message-ID: <CAPa5EdD7tFRyDztEanTwQXTzVEE8T0FLkbXAtWxUcGGaLYt_bA@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] r8169: TX stall with checksum offload on
 VLAN frames with inline tag (REORDER_HDR off) since 1517d1996b52
To: Eric Dumazet <edumazet@google.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	nic_swsd@realtek.com, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"

To keep the reports at a single place, the bug affects not only r8169,
but apparently some r8152 USB cards as well, as reported in [1].

I had this one (0bda:8153) lying around, so I will conduct the testing
of the patches with that.

[1] https://github.com/home-assistant/operating-system/issues/5019#issuecomment-6111103634

Regards,
Jan
