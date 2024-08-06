Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4104C7346F
	for <regressions@lists.linux.dev>; Tue,  6 Aug 2024 17:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722966919; cv=none; b=W8Nm6TyzPK4e+4QYEHxaAI6YvrwlZ38x1pIH3NaaEojK0JkI383mB409ARB/XiTeT9j+O2bYguWb9or3l4cMbt/ighvZowrs/+YGThHHYo1Zj/rwT3SFjVMnsm8jzuVo8BcffJPedjjb/xTfg42U/75RylwqI5TcZR+1Y8yjbYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722966919; c=relaxed/simple;
	bh=dlKor5S4KZTtlApY8vKRh+RBVjDgqah4CvicECM1T2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKRVLCRzCeIUxiKfFram8NtOQ8TlmJ1e3KHe6oMbnYZubegZWQDQCw3KoajhniHDYJEQHwG9192AMWfw1JXbhiqBdRHurxWkKk59wxxGRRp46Q+axxVhjvKlylMYlmH4xZF5L80EJKQSUFm/JEi+I6Xra6rHzcnpgZfwH44YjoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nO7wGKCj; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nO7wGKCj"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f189a2a7f8so11552621fa.2
        for <regressions@lists.linux.dev>; Tue, 06 Aug 2024 10:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722966916; x=1723571716; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dlKor5S4KZTtlApY8vKRh+RBVjDgqah4CvicECM1T2E=;
        b=nO7wGKCjD89ql9OcM2gnTjc0viZuWWy63qYC9gvxBjTTrbWHSueouRnDk9QERgOqi8
         jAyDACn6pjANodQ6ydgBu6wyG+XyEUIRRU4QXLeAPpF18OWYLMbVRK9omw6M7LeUq0Z/
         XuVU5ID5zlQ8Uf6wB3+uyA2I1xdopKJJe+Mm6r4KUFOV7PyyAzV6VaUV0NvWGSohhqR/
         0q4JM3VVHDkkjb3uUTCXO8PORr4HQIsECILXo7YPvRz8aVsZZ+aD4fXw9eMsuziR1LKI
         G6UxFejKvT8apjVKtaBaqR/GbLR8IesqAL2l45RmoyQWuwjW21H8BrCZUG2zK+tqydCv
         dGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722966916; x=1723571716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlKor5S4KZTtlApY8vKRh+RBVjDgqah4CvicECM1T2E=;
        b=AKusgBSz4lgqAQd1yklpBE7lXCYi90df/wsLnXiSaRju56bWwFK1KCgIlvHKKkvSUK
         6VNl4BOYk+C+4yTRNLtc8O9a9fob8KZAhKzvFZ4mDqUnG72Kqkag+pdSGggvYojaYM5B
         A5zctC+zhqpxFRevnK6ib7HZPbjvSw+4TUUBynMFzn4LylU6b2yWai+teMEgGlNveOte
         jc1vczCd/kffl/fUxQmWMS1UciABiFsqFN9lxKx3w7einCRxHE6MPgv43VmXFYWHDELW
         gx5dHdP6EUqx5B/ttUCycPXxHq4SiddzBMINONM15IP0tls9Brc61BTiEbAlFg7W9sUJ
         i/ag==
X-Gm-Message-State: AOJu0Yydnfdjvhg1WvBkU8Vq0dKNF09496TguQd72HOcmQLZA6F08Toh
	6MmwgXoIWsn0tIcXJjj90Zre4fhTYfrtNCEiDkej8T0DiXYOk2bTltitLA==
X-Google-Smtp-Source: AGHT+IGslzbtBNGll023sYG20tJekoTuYzSHLMfH/zJMMs3DJvHbbhuUhDqEdxd54NQsliKDQzpvXQ==
X-Received: by 2002:a2e:9e02:0:b0:2ec:617b:4757 with SMTP id 38308e7fff4ca-2f15aa95757mr105344631fa.13.1722966915621;
        Tue, 06 Aug 2024 10:55:15 -0700 (PDT)
Received: from alexis-pc ([2a01:e0a:d77:ff0:2146:fb54:fbe:f1d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb64952sm253629025e9.37.2024.08.06.10.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 10:55:15 -0700 (PDT)
Date: Tue, 6 Aug 2024 19:55:13 +0200
From: Alexis Belmonte <alexbelm48@gmail.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: hp-wmi: Add thermal profile support
 for 8BAD boards
Message-ID: <ZrJjgVkVO5S7ljY9@alexis-pc>
References: <ZZFGgfsfrU2vuQoI@alexis-pc>
 <84632b31-6e97-4493-a97e-572d288b294d@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84632b31-6e97-4493-a97e-572d288b294d@leemhuis.info>

Hi Thorsten!

Thanks for the heads up! I've taken a look at the report and proposed a
patch to them that I've not submitted yet to the mailing list.

I'll wait on their feedback and see if it works for them.

Thanks again and have a great day,

Alexis
