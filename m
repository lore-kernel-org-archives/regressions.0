Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBE136E460
	for <regressions@lists.linux.dev>; Fri, 17 Apr 2026 22:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776465717; cv=pass; b=FVKtjQll1dj8iog9wXnv+4r8gxShhiIOqbD2T5MW0MNQ8oxOhkZ9afe1XfmuhbvU2uBpqTeu5SviHQ4Yc/OMgqV9yC0FAlcnnS75UdiIPe5NmitHkNP18V22MzKpk8OpJ/LcvUv8+iGfVEk7tuEi/9T5ackX7Ldb9b5iSbc9YTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776465717; c=relaxed/simple;
	bh=/YD8yp0xWKwI2D2OtGnCHdTeUAuw6QirUv+ahBuIzLQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=QpHmqcfgoW9Oz1l/SI6l6WZpYOR/4EsVryDBXh3AIiaMfwy0a+Rqll29m3ZT+zvsN5PBUeqFmOYLPM+NErkoHRCSjaA6QusSOr+x/16r2dWV7ayEhP4g9NFk3u+ZKW8P/u+b5dKM1OZa3EK/yX0yz362ph3sZbD+nOVQup4aJls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YE3N8Jao; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YE3N8Jao"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1270fc2bdf2so3741c88.0
        for <regressions@lists.linux.dev>; Fri, 17 Apr 2026 15:41:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776465715; cv=none;
        d=google.com; s=arc-20240605;
        b=iulO5uDYtvFs34wiIcGTMDhvbErUlA9D8pQnrtV9k6jUlkBVXK2UftRR4gMrU85HvW
         56GVaiZBlXgykZHWg76u/aRmX6e/0cJjrsXQ6Tfgeb9UpxzzbKvoquT/Oz0DjXXSo9vd
         llKeuPDni3V+Rj754UWN45lMgVd0mR/7V0igA/fsQsbrxBEBv0q094uRvumCMis4Li4Q
         Ji2er5kjUJWCG5HXqM8TDI+qBdv9I2OHmZ0gMe1EymMOjOoOQQL/LhbnpqAYypyVlGor
         Vq+fNP64gbJW9ynxltz/B9Qz2jVXV8EZ6c9YWtdsKWMgRoQQCQ49hOL1YShXUVlPp7ie
         1WuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/YD8yp0xWKwI2D2OtGnCHdTeUAuw6QirUv+ahBuIzLQ=;
        fh=9p4NP76Y+vWQ/uJVYA50nGMW3wZBbJ7oaVJxkrzNXrc=;
        b=OeBzbJ4lIRnVA8HeECg/VGRUuaG2KaYBvaV21uoraJBtR0ES24lqF0KePJV/I3DoTl
         156fW/RmFOWjukNnyGmjHFE2vqNL3mht2+cTG+/83NXrYL88BPq4asgTLJQAM1J4x5IX
         YhNqbWGJ+Euuczv1gGaxeXhU7UoR7JBukFE3ev63gYXwGhuYSffLkYKwGjOCyUJl+3MH
         cqu+xKcFb7bMV/HzeOeAExfBhA5ADL6fRacrTRHnI0V4qxyPz63zHtFVXdIgG8sl6waf
         AL+nhXRj9EA3Pj+cNJJgkOphi/KgteCJ4CvRBCYk0buAiI5psjhaxSFqQs4PNGFICbKs
         FzNA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776465715; x=1777070515; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/YD8yp0xWKwI2D2OtGnCHdTeUAuw6QirUv+ahBuIzLQ=;
        b=YE3N8JaooQBwSjbdV+puF3UYx+7wKuRSBfR7BWffRVnCCGAqTf8f9iCIBkM3M9El2p
         3Hgv2qu7CwkUeIf771ssapUJNOWECF3KlIGhjRWJFP+nQeP00t8ZigAOFf6iLDsZCpXt
         IIEXRAAjuyKcOj+ZXhnbZupDYjQZy+iS/mMa0n0jdu/Bk77ZKs/NRoeBIlLpQNtv0252
         y4gkUcXfChg39E0Ph7I3ySJWHFQ79ge9fdFnIZtuWMKGh/aJUTb9e62/4yYX1pMwvc99
         qRiZf2BskRGB3ZhvPvfMx6NzqnMejA3vsK3BpE9pbelo67kVEyU97Z5XyW1m+rkcMPbS
         dzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776465715; x=1777070515;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/YD8yp0xWKwI2D2OtGnCHdTeUAuw6QirUv+ahBuIzLQ=;
        b=jePTelDPiRRQ4BmCBdBt9Dz2pUmf/UH38EOHEoC3JBgWFxwrA7PYH0XiRyhbD2hjIy
         lZ7eaInspUt+5O+LlCKzhJCjkZxAdL/rUu29yERBYM/Vgn8vEFcDcSOtLOlUiJJtw6r5
         rx5YYPy7hu8Q9KOI2K5foDgTHu3um5lHELKcSfXz/0LARli1n6P0Rl4unW33aDx6ibTn
         q3LdArQ4scFLt3idzLywSRKp1g+Ve/7qqaHjI4fDyKq2Zw5CXovahlOQ8/GVUrT+8ipP
         2yHp8Flk2Pdk4FEhWVeRCW04myReeCr6A2mpmYm1XWuwmoJj6VxC8kDxM/yIo6xeoFmj
         Cm9Q==
X-Gm-Message-State: AOJu0Ywia/DW8UZFKsCSVcUzhT1hTezuO+LNqd64EWgQ4iSKXMD/Jqgq
	3p+YL9EUGFPTLI25MDOBhfrn0lCeu4S6V88mLXgeuwmT1e3qvwy7kNlWcpzSlBvbZcUKMdNIvJ9
	38ERcAF0ZoQ8kui5dJJeYa+9CWbwL/aH72rJIN589
X-Gm-Gg: AeBDiesshHMHgFUJFSEMtinx/nT2heu8IKV6jrUiLIsq4gmImCdbgzs0sQTBcn/uWqb
	pzJ95+BoNuOhvzAWHC36OYM7+YnYUoefd40PIOQg1BzlxVq2UeG4LDO8SdmF6ASprPX4+ntr9fZ
	iEuU/uqzBNKuC3NWJZaNof6SfPThu0wG0wELl8B9JD11uk4AU/34IdXox/dpu3fV5MWPjHR/KVf
	ENE1Jpy1GNbz5wXBkyD4zQoBZdzGsZ5sq8qOMjNjgyJozR8Jn4ZwBjNiFwWYKle1Vp1qBi7kzTH
	w+EaL74Mthgo7I2kyzd6aTPqxIY=
X-Received: by 2002:a05:7022:3897:b0:12b:ebb9:1aa4 with SMTP id
 a92af1059eb24-12c7b2439e5mr16861c88.11.1776465714573; Fri, 17 Apr 2026
 15:41:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Derek Taylor <ddtaylor@google.com>
Date: Fri, 17 Apr 2026 15:41:42 -0700
X-Gm-Features: AQROBzABZCgNufzPUq6pOEIfWP4LIaA5TVHKwGDxnLvjf8jBv-5uXGiK9xMJBhk
Message-ID: <CAHWLEDHfXZScF5jNDzgOxGXf-MBDcVNtqW0DbNz8Ra8rtcuL+w@mail.gmail.com>
Subject: [REGRESSION] Return change in 6.12.80+ with volatile mounting
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, Kevin Berry <kpberry@google.com>, 
	Chenglong Tang <chenglongtang@google.com>
Content-Type: text/plain; charset="UTF-8"

This change seems to have so far affected at least containerd in an
issue reported here
https://github.com/containerd/containerd/issues/13250.

In stable versions 6.12.80+, commit
6c0cfbe020c0fcd2a544fcd2931fbc366ee3cd12 with the specific change
being:
[*] The mount option "volatile" is an alias to "fsync=volatile".
In this scenario, code relying on checking "volatile" will now fail
due to the return being "fsync=volatile".

#regzbot introduced:v6.12.80
