Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679951;
	b=Zf+7gK5aFt4ki35limivcsa//6UaeW7gbGWpaffJHIyQSz7Z05HoMqeNee6WxSalqZA9
	 p71EN6sZuvQicoTJO6bw/mZ1gbNa7ZGBt8aYRqAxf/iVtIFhZdW5tjlKnvZ3CspMUvx1m
	 wwv3yCSry0P/Eu09RVespLQUd1tSyDcxT6rd26ZMpc1SClXD8VcVgPr3SokGLucHfkqJ3
	 k2Uf31MwuMOZFYw4oTiK2HNN5kItA6uZ9EcfAaIBRlnQajLQ6hMEkL9yqwSw9jIPz6pHB
	 OYWOrJmAcOaFG9RIaCBNBX1H0e+qTSobJBgIOEVs9o3Pa5QmAjovGa6bVbfR7oZbFgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=9rQHvt1++T9QMl50K/3fss8AjEtMjuii+WgAI0w3x30=;
	b=FifDbvSlD7nb3ZEyGfzDfIfIhBaNLSjxOh+K3HyyzFR4LRl8IAam9HAY/uQ/8ImJbUfc
	 OtqrxU4IGhEySQ4b5Ym5706W9Aha2QLqRm4uOvKleBimH7lGlriwk2HjT2vviIQ6ZCL+s
	 pfsxdI+X25ZaTV5vLjLmWffFVeGzeKGTQKpY79GfhPwkaqsWBVwMbnBjoHSjG0C4bO0k5
	 I+9oIB3hRPu0FmW0K4pILBDgl9RAdCaSlaDZU6/TuhimFqmt9Gkz8u6AivIgjlWk1q7cL
	 tAJCEuf+S9DKp71S3iK/VCbNQ+ljR6f30IeIdsewJoT2N/SiBhZbmtyMfwEZtKmwg1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=KjNWQcgf;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47211606A339
	for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 07:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47211606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=KjNWQcgf
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3acec6677so10198132c88.1
        for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 23:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1795679944; x=1796284744; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9rQHvt1++T9QMl50K/3fss8AjEtMjuii+WgAI0w3x30=;
        b=KjNWQcgfHmYmQ1IjzCdpDDsflG1A9g1V50ptpzPuTb1GELExNNXXjkpL2wb3MHc7jV
         RzF7i1llZFlXc/ZQDR++u2PJui9+no2pf0lRZ1mnAIEJ5iKS+YZGJMeCSlLJhdlrBUKn
         sFDRRXZr24UneM9Xtpo0WkjRanr+W7x7ZL2lJbyyYfL01nH2h4FZHNN6DlyPORygG/2Q
         +Gb8mFztbTgtapMygcS/yRTxitHWHX7sKrwEppoo/HdS6BZ11iEUhXtJGjV5W6RzK66u
         ou4SsHypsF6NYI6XP+B6RwK+ShKF1t0KhzrN6xcOBwHoXqulCeGXMxY1EsQQ2PLKB2K4
         GpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795679944; x=1796284744;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9rQHvt1++T9QMl50K/3fss8AjEtMjuii+WgAI0w3x30=;
        b=RTmYDDzqV2oUdi+eWDz0SfSGIkKc3Z6Et7l3xfIqWjwdYrYZxbJbprEewzW04r6X7P
         /ndyUGzBKJWXZ8dRiQR7r3L3Q7K6CpX3gj4mimpWELsuPnAZwXLER4fn4A6R6AQfjTS7
         76pwI5uXsR/qD4kQK1eJwKOSLTrB3QXAccbkJkNn343NE1bQbL5GpnF3OaTbjmND80B0
         h6VDg16iKMi3Gv2QBqTWcWEXRH6Jt+/qxy5NCUBbWZlt5TUTm7CwwLmokkPt54t6hR9Q
         IUdUY2et90xWPpFeLfcC79xsIH4riUBaGCbHxavtEiCh+yNkjOReO9kcIT4+RIl4mts3
         k/2g==
X-Gm-Message-State: APuU4Z8KW3voUHTxHwReC6YGkKSOcEamElkxj2FwlsaC1uEXXX98sY8F
	Ks7K5XqLrxAAM7AV5E3LMuum7StGxaM2aXnPyzh71yTjXU7D6nYbvpMO+2F7/3iIdBo=
X-Gm-Gg: AZFdTZfnIP5b+cF3FKlMoOAX4KPMvppwsoYU1cAaRmqd7kYuwSJtodiJDKw2sFIJS6d
	/TNkmf/Hqkrk3bpl4C08hwibe6TyL+/VTGmaDy35iZWq45H2+HTDWQBkQY3imvwAnJgQDEsvFdO
	WpScAvddsIxtC3Hnet97sRDj0e2TGK6Dhgkebsuh7aj1fdT1L8KLZzn/4UOX/2tYTkz0QCg4OSA
	MpVdpMzjrNfT0tAlHxTsjOmp1FOtDbjCE/LVbzLkT2axxJPJ90ZWd1JE3WWirhmPNFJan1YEBGS
	fHhwkh5a7afttDRNXhmdLSyYyVMNtmDxl7+xu/cFjAmMjclOw0VueV08nWvfTUB+8Pt8hNWx15e
	M605P7me6GHbfC56wp7uzt4lRrtFZMkEBKWQw0S2U6hKgtzQo4wBsKKTfreqGMQFYGTVXdwiLlx
	O9UJ1Z43v/8fJtz0aH5zMfQPIVl0nqwDGEHCxuV5/P4yoaSay+X/Yvtk4Hp+CCPLP0QZN2YnKm4
	ghYttRm+bylmhwz/is29ufWxOHuXDehCrL7NHaJLrxzctgtRnGaQ6FSttsdncNcq2B5r3V9zOh0
	LtzCzZslGcWq3Y3TpAD/Xw==
X-Received: by 2002:a05:7022:ea8d:b0:1b2:373c:997 with SMTP id a92af1059eb24-1b5568f3c7bmr18744751c88.25.1795679944142;
        Wed, 25 Nov 2026 23:59:04 -0800 (PST)
Received: from 52d83ede7c60 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm47391602c88.8.2026.11.25.23.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build)Error in
 /tmp/kci/kernel_build/util/setup.py.mypy_log (util/Build:4...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 26 Nov 2026 07:59:03 -0000
Message-ID: <179567994327.139903.1241567093662519898@kernelci.org>

Cc from: regression/mainline.yaml

New build issue found on mainline/master:

---
Error in /tmp/kci/kernel_build/util/setup.py.mypy_log (util/Build:426) [logspec:kbuild,kbuild.other]
---

Log excerpt:
=====================================================
make[3]: *** [util/Build:426: /tmp/kci/kernel_build/util/setup.py.mypy_log] Error 1

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179567994327.139903.1241567093662519898@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:3a64267c1e7f682a5e9b1571bb3162c76766480e
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  25faec9ce61c01fb45abf812a222c5b43c3cd5c5

# Builds where the incident occurred:

## defconfig+lab-setup+perf+perf-arm64 on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6b07d5c6286e1965ecbd994b

#kernelci issue maestro:3a64267c1e7f682a5e9b1571bb3162c76766480e

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
