Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2393721CC5B
	for <regressions@lists.linux.dev>; Wed,  3 Dec 2025 20:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764792350; cv=none; b=QuIr062pU87sPd5i+Et4VIN4wBSUwQtxtq6kX96I/pqx+ZdkC+XgAKPruSckxSQApDDBX4xWTiSl1z/+13d0HDUOl3lAwLKmfSoR90G35kxq4Kw9AmHfHLlo650QcJ0J7itk8PI8rHTXVzYwhWr246f437VSwv11g4iyQLKNe+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764792350; c=relaxed/simple;
	bh=AG9GrROvweeacWEAdRTVykiH1D+eyLznjpshHadtW48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ddh91meN8jIQshOlvshFYSpBDdQlP09joBrZRgyn6lYhjyYz+xLvJLDJuj+Fa7720kkVGxLwaYTdsQv3N1bOorB19qQRVzT4PZ+8MhG5n0Td25AH/cVheTa/YuZMGKDQLq29UnbbC2YmThT84EwcYbnFbqNzmlQfLxlGiVe8oWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXvuo6Ql; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXvuo6Ql"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37a5bc6b491so1517051fa.0
        for <regressions@lists.linux.dev>; Wed, 03 Dec 2025 12:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764792347; x=1765397147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnUb7wkPZTtLzr68E4z+N8DU80QWM8TPlOvaXkpc0Ak=;
        b=cXvuo6QlKhn/KrpJS/IqgvNjX3dzaJ+rSr4OJmIQuS91jzd/k5+gpsarzqFs3SZZ3c
         c1kBm2lZjY9Xw/WZyrRWqVtxxn+ZlmIj4UFHbTIrWIE8B2nFlCiWvk5z1+XCqdURx3Ek
         taOI2fEsQkJgmu0cYFCqWhdxdgxvDEOypCRmDRYJVV9NjgWjO2tPPNHmcCG9eDOk0CkY
         b5VxYg3Rlocw9mmwTtRi+VDmW+NyukpnhdXuIVYvGc23GLicVhKYfktRmmb+r+vJGEpv
         mQ6FyXjWqubgu1cNCyRTTyoZEK+Wj4BotqdGSUcRoaoq7x9kzk5VL0kzcETo0l6q19to
         XNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764792347; x=1765397147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wnUb7wkPZTtLzr68E4z+N8DU80QWM8TPlOvaXkpc0Ak=;
        b=cvrD3iJma4x6tNfKg+rK9f0QU1TvTZYT6/uuP4wjdcvZlbD1+x6hN0q1KEHUFfoha1
         fnpXVhesz+kBGphFwzTVB7ln4TTuYAgUmxjIcdVfEKuKD4SCUJ+dgVZTRumMEboQMQfB
         XxNXwhozbgPLzAJj/Oz8jmRRw4j8TBiY6HvCOhjzLdGce0qzdhxbF0/ycb/CyRkNBfHt
         fsLNfRiW15EpQYFj51kI3kAuAIezowNUznwPsnOY0GfAWwAlQf5g+XwdBwDpI/Q5zSRl
         pzHaPaFwSTkQFISAQ52e0p9cvoXg+CyHZqSBpeWUfVHSmeNp8CvlmHmBohxCD/I6/xZy
         qanQ==
X-Gm-Message-State: AOJu0YypMpH09w5qahuWBOVCnK1PQ5BOHLAj1TFIu00EJyzkzowcg8hi
	Xls1SxQahaja0SzbGQjXO9LZsmjMPq6G7iXtZAAzhm0Hs23hXOe1jbOK29ocGQ==
X-Gm-Gg: ASbGncu/IGZeA9BRd+eYz5GgpzbiFBWR0BGc7VkuqK+g9g/NQStoEQXXcHpMZMhi6U0
	dIrnyRKTd3/0oRmQuJEU+xlp4GK7M2JlDW8jEJ6NisXNrYncaZzFxXv61gcUPlywB9uNPjyb3D4
	GTRhpiIfPwkS3PiF6avIWHc1BVsPsOoY75AVkIDRfkqv/hzw/XmEGm/midKYCOxR2dCNLPro/Vm
	s+mKFRLUETzyLeOCUp2unng8DgDmAlGZoXyDpMtIzZSrqrZSRo1zD9oIH3oUsdfJsYZ0RxXhDE+
	hQLVAo+sAyAGBfH74HUXKXQXo6u5+sNG71HIg2muC3LOGKcg9n9wb0orFiJnNHVJA6DtBbHVHcw
	3uvqzSG59xm4dBmrfXv3AnU+LYmgmzb7QnmcWfPYqpI5wHgIbBBwbtmBJkTkK64W7xBaq+xgmJQ
	leeg/XR4Q=
X-Google-Smtp-Source: AGHT+IFcrgyNy9/ys9WRk5jnvE4VJKw6Gba3tzTM5kC/GYNY8kJZ0Zuoj8YiWvo44qtPhCxdA2OHmw==
X-Received: by 2002:a2e:3510:0:b0:37d:1911:7a45 with SMTP id 38308e7fff4ca-37e639571femr9547531fa.42.1764792346686;
        Wed, 03 Dec 2025 12:05:46 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-37d236dd782sm44470811fa.15.2025.12.03.12.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 12:05:45 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: regressions@lists.linux.dev
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION][BISECTED] kbuild: CFLAGS=-w no longer works
Date: Wed,  3 Dec 2025 23:05:03 +0300
Message-ID: <20251203200536.102101-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251009075149.1083040-1-safinaskar@gmail.com>
References: <20251009075149.1083040-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Askar Safin <safinaskar@gmail.com>:
> #regzbot introduced: d1d0963121769d8d16150b913fe886e48efefa51

#regzbot report: https://lore.kernel.org/lkml/20251009075149.1083040-1-safinaskar@gmail.com/
#regzbot invalid: there is no bug, kbuild works as documented

-- 
Askar Safin
