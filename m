Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3111607AA
	for <regressions@lists.linux.dev>; Mon, 12 Aug 2024 12:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723465222; cv=none; b=HdUxb7hh9w7Vjb0WkiyiT3qvHy3g9jexxKx0KA6fGKT6SzNh8/huOPob6/oG8KvSDlKrAo+cSLDF28tO9IOkRxS0lpFdToh488QrHTVwYPwR+l2AeqWgGWIA8PnE+PXumJJLgXzguiXU+yDSab14Zh7lsgEV0DNSHd4ni9DDSSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723465222; c=relaxed/simple;
	bh=kq679JXFB637W1Tqu4I1bX+A6aIDNhhFQURQtdBO5n8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kuguL8zzyTfQAJOs40OAT4YY5hOQgN0KL7IVA5OUpmC0FhxXSr1NdnK01kLfi9nuQSkZuQUKY4o50jgjg4YbiVSHcraQVaQns/R6ajFZA5lLA5ug+Mop44G5MIlLQSrXS3bapqLcZsevdAbXnkodzOatR6EntFkz7q04eRx7oK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnY0CMfi; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnY0CMfi"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6512866fa87so37187747b3.2
        for <regressions@lists.linux.dev>; Mon, 12 Aug 2024 05:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723465219; x=1724070019; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kq679JXFB637W1Tqu4I1bX+A6aIDNhhFQURQtdBO5n8=;
        b=dnY0CMfi1XvWAT9zIbbqbcxGbphSJ2e7206RBE4E7F7+vPhvNPj7kbm0AgIwKhoW+Y
         p86oAr1Cqsd1JZE4WB1y2s9hB3PKIb6/3BmiDQD01md/Z2n2Pd8zTfSqKPKOtnoeO2hI
         wJMgLd8t+gLVpBrmQLO8oYSxOfAd+pOCrE7v0DOBsLsO6iEX9gzwCmLrWV61Cuc5YvqW
         mVP/q3JOkxuHZb7l0FDnjSfMGIfFQlDJXi/dXpQKR4flot0V0+iLRhvlaz+T1kbh7a5r
         5iYjgbFpwb1jbJALpPzA+XuBM8/2RIvhmQa7bL5eUREQpt1LnHnXsFMHGZqysfKjp7XU
         99Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723465219; x=1724070019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kq679JXFB637W1Tqu4I1bX+A6aIDNhhFQURQtdBO5n8=;
        b=UwdLQtRZv8BAZKghIeNvZM9t2n4LkiMmg1Tf21vuKZ97G1G5CFTy5gFBG5tyZk0R7U
         gOD58WneX2Y763cxJzaRhabx1cZSez1b/74Z9eiTYOs3bEIae7tYygkjCN1BJTEuE2ws
         CM2AY89rV4Q0ByjD/Q/UwJOgqujTz0FB4mh+hDrNTpnG+qdenplEpAaQ7zdEPoaknx2w
         fa060gLUwTTq5rtTN9cL6pKPUtZqckAoC5BELUYxzC+Eww5X34bx8XUOhJDQC1Fbm431
         pQ0j2zM1xpkbbKZYGu/FsgjHuNvNdltXOtEfPcgAPjMhFKv4FHlPWnQLmtYPbuwNAJLr
         ddSw==
X-Forwarded-Encrypted: i=1; AJvYcCU7EqqhQC9w8VnntF6PDJuHIy6o7sTlWmv9fAAJE3OewcQV6CymMvEONrfCHYFt1SlomcQAppjdaul9VjOhbEa3hSbQls9XXDcTPns=
X-Gm-Message-State: AOJu0Yw08UH1YBbSwzvUFahOlWLz4wRVPuJE1MG5oBWRZUKBSsc2gx6c
	xfnLZqzzpVlN88WPOLb5u+jvFRIWdbCAgP22QEg2poapFVjIeJlKMB9lS8DHggRuvPZUu9IT32w
	BJ78aHvhww8sISYrEBLMhkUi+e/Y=
X-Google-Smtp-Source: AGHT+IHoFBN/+scGNP7kMLSb+aFYncBccPyOI8lBlEngugp5xukhJsJHIQw6I+Ur9TP2C5RZZu3F4dqoOyQT+HCJCRM=
X-Received: by 2002:a05:690c:ed6:b0:669:e266:2c55 with SMTP id
 00721157ae682-6a971ade176mr2159407b3.5.1723465218646; Mon, 12 Aug 2024
 05:20:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240812110640.460514-1-benjamin@sipsolutions.net>
In-Reply-To: <20240812110640.460514-1-benjamin@sipsolutions.net>
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Mon, 12 Aug 2024 13:20:07 +0100
Message-ID: <CAP-bSRY+F=_zek7Y1mMftQJqmkTenc8_sg9J-GO=aaAcLVRvGw@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: iwlwifi: correctly lookup DMA address in SG table
To: Benjamin Berg <benjamin@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, benjamin.berg@intel.com, 
	miriam.rachel.korenblit@intel.com, regressions@lists.linux.dev, 
	johannes@sipsolutions.net, Kalle Valo <kvalo@kernel.org>, 
	Ben Greear <greearb@candelatech.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Aug 2024 at 12:07, Benjamin Berg <benjamin@sipsolutions.net> wrote:
> [...]

Works for me.

Tested-by: Chris Bainbridge <chris.bainbridge@gmail.com>

(btw Benjamin, did you see my other email? Subject "iwlwifi: WRT:
Invalid buffer destination".)
