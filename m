Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA8F1B87C2
	for <regressions@lists.linux.dev>; Tue, 26 Nov 2024 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612735; cv=none; b=l62cbTqE6pu0e29JDcVf1Y5aZnVeiZ6HeXCpI9GzibdcW9VWacyUsZELK6dLzUoB82JD1h3xzMsMCxZ/w0sGrZtxPEMVmvp7Lge/+5yS/cJkiCUkLsusvH3q/jH3YRCdPwj4gmRbrSzpesqHnZbWCNx0PxYpNo8A4z/AFDvSVFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612735; c=relaxed/simple;
	bh=H8eF2eXLoEAWy3yZQI4qwWZRVJnCj0BbC/ST/Qo9VCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=by2IVgfrY0qvauWBcQgQfHOP7s9u0eKuD4eEV9gb0NJiq7s8HlplkGrnbpFXVWWI9OOZptpK7ywhM6d4WoV/viPKRoXPhSgJpnRdtcNci8AzOxMt9gDIX8rmzkV3VGEYQRDVVSlXFifz1zwGjhW0DYpxECJPYJA0plYvFV4Ri7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9wX2Hqt; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9wX2Hqt"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e387ad7abdaso5641426276.0
        for <regressions@lists.linux.dev>; Tue, 26 Nov 2024 01:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732612732; x=1733217532; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVDCky70auYLWD6XOWEkaP+WV+CoPiiKjrNT7eFkl2U=;
        b=h9wX2HqtjzL65arairFPwqD7fmtY7/EA4DC4N58Wg7Q1lNwxblstl2LbRGs2aSEMAb
         TYpaUdbSkkZsjnbAYFnpGdyBogtf3r81tx+3qL/zNkVJ4kJ2eQCYrvNBdFV0EW7Peryp
         LJuQS3v8qPMICz6M/5xOxKvwv5W6u7opeY2KkpIZIBIg2XKJ0DeBvBX3/SvCJhcVBuFv
         T/XR1dvDdJEzBzE/S20hyAAOz2pr0j6W55IiJFdy+gclRhrDAzJJfAWHWbH8mPcUYb86
         5H0CMwW4aEmcQRqrrMc2yi7S6dXX5V0bu6oGN8YvV03+dW8l/FnV3q6EP0pZb4wM1/eK
         JF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732612732; x=1733217532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVDCky70auYLWD6XOWEkaP+WV+CoPiiKjrNT7eFkl2U=;
        b=bQYWzPKyBRXFlhX/hq4PuIMFX6D5zTxAzOg+UpOTBz4wcbficouNvjbz73ko69w4wg
         xbvEFF9UM9RFt9eUzBjhJ8rbou7XY8mDVHZV/Ksm+3eL3QcpvDiU4Tj/XKMQKpL2RbUP
         IZU6HmgIqyz/Wi006QRA6P00JFET9FQH0ki5bT7/dcIqGthPYFoGqPHqd84InN6KQWkQ
         XsU0mqGuboEbgijEh+XEqGwRef4ukgNubOIhzS20jUj8NBDwdIbc9r+T8Wvyp1Rmnbo0
         L+F2H2GfnPcd0q+ahPKfRLnOOzUQk+YKsarAbTyM+XqwYhWxhaUXe/Ca/xfIpnCDfIh5
         rQpA==
X-Forwarded-Encrypted: i=1; AJvYcCWSlSxv6J7/JgNsfueootJfHtRdIv/paimfcSEXOnk/eh3vXYVLQhga2yNKW0i9TeW1TkgHxRl/wmwfuA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYkXeXA/UwHqrZRWakKj1T5XVkfn5Dvhae1w7vlX1avt8XKtKo
	eGaZ6C30swxT+MIa6ajJIbFMfDc0qT3PIvLdl/uvqbUjvuRYaVv5qV5enGdJI0OyTZ2cfe6wPjh
	tq13ZEklGS21nXn1hvB1XrAcc3XM=
X-Gm-Gg: ASbGncu3DHC3k6nfDJxzcjBy8vRYm+eNuf7yGGryU3mTIN3+rk+uIi7TWaXNv14XoAF
	0MvB2VgI6Pg6MHWKC5I+rqXsDLK8XqmM=
X-Google-Smtp-Source: AGHT+IHV02X2n+cTXOdwOWnWyjBXRCSdI9G0x+XWqC/yRz8lOxPMnte8V4M5zojwdV+Ku0e8hXCcOj0QHix71W+R8dE=
X-Received: by 2002:a05:6902:33c6:b0:e38:f11c:f04e with SMTP id
 3f1490d57ef6-e38f8c27cf1mr11236518276.53.1732612732255; Tue, 26 Nov 2024
 01:18:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAP-bSRbCo7=wfUBZ8H7c3Q-7XSG+SB=R4MHHNNGPvBoinsVSZg@mail.gmail.com>
 <CAP-bSRab1C-_aaATfrgWjt9w0fcYUCQCG7u+TCb1FSPSd6CEaA@mail.gmail.com> <20241126065228.GA1133@lst.de>
In-Reply-To: <20241126065228.GA1133@lst.de>
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Tue, 26 Nov 2024 09:18:41 +0000
Message-ID: <CAP-bSRZehc2BxRC_z5MXKQ6qHNPXPgZoOQTtkiK_CFd494D_Fg@mail.gmail.com>
Subject: Re: [REGRESSION] ioprio performance hangs, bisected
To: Christoph Hellwig <hch@lst.de>
Cc: LKML <linux-kernel@vger.kernel.org>, axboe@kernel.dk, bvanassche@acm.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, linux-block@vger.kernel.org, 
	semen.protsenko@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Nov 2024 at 06:52, Christoph Hellwig <hch@lst.de> wrote:
>
> Fortunately fixing this is not only easy but also improves the
> code in mq-deadline.  Can you test the patch below?

Yes, the patch fixes my test case.

Tested-by: Chris Bainbridge <chris.bainbridge@gmail.com>
