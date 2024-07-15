Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1033017BB5
	for <regressions@lists.linux.dev>; Mon, 15 Jul 2024 18:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721067837; cv=none; b=MoloQpYK13aZwSJ0m+usDdvSJV7ZXsaMBwAWKGl510eoojk3/VeiUsi3Q1TMglIByw8BdCeh5IR5xk9JPkPJPQYijVgpx7i/lqWl9IRKO+HaDahGx5obFThWavXMzR6C71jTXsYirCMyz/N4fmlTkiR9d246CTq9qeyntK5pcOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721067837; c=relaxed/simple;
	bh=rY+ZglPfTax4UbXbXo4++fWTE251iljFO+tNpvqsaZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TB03xnNUfvQjRFdIfAlHuIZj7X97jw23WvFQqN66doK0kjonQO0iVm1qGMn2GG+vaTnW/p2ND78zKUjYaZ9wROWz0mUAS9yOtFgKYd2uupVz9bdG/iis4fW5AEhpWT5e57bUXUc4GizXqkbQC1A4bBYP9Vc9s/pnvjQuFaqpNYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQoU4EqL; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQoU4EqL"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70b13791a5eso3803407b3a.1
        for <regressions@lists.linux.dev>; Mon, 15 Jul 2024 11:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721067835; x=1721672635; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xm6Kv57KRZBfQQs9+9DE/pC+uCpbt9UzvazBZL0I0GY=;
        b=FQoU4EqLQfQcLBsfLHRiyv0nFwy0TuRlC2YU04Z6R9cvDloPcGBgUx4E3YFtKfBOwq
         1Aq+MOecOnrfXUxStlW2oFoYtwb4BZvexqMf9uHhUyxCJUAiwUSYjF5eOf5axAHCEvCI
         7QAuvv7r6G33xvbSNPDWk8jEG5PUbHkxnK0OL7u0o0t8u6pKp+q9kDW9rugJnx/PW49s
         JEDN9m59aCdZeANsM8lJWM8YnY4Ki4xvN18e9jH3GZgVALGWfrxWBRrQVuqg7SUZGkoa
         8/f6F4Y0fVlHh1XFxx0xY6f6JsYXCw6GRskR/ZUJwOx3Vp7ihAbYobuM7AcYc/AKTk+D
         8aZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721067835; x=1721672635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xm6Kv57KRZBfQQs9+9DE/pC+uCpbt9UzvazBZL0I0GY=;
        b=Td09JqHUkigYZ6fL9/krl4yWqqWhKpJQuM31gkyvKhcMZKkY9GCUVpqqPr4Pkn1668
         TCJ5f+R3yNUJij50PXii3cIoJczslmFhWSCrPABDbroAckONc1bnWWoxWsV6SVdcKwmu
         FBXFhDebRmwUcGeojY2ColnFdbvzZkjK1k6ingl3Y7wLVtGVpiLjEj8vxQFZnYxAD6+0
         LeUo3S5LK5ruYjKjKbvGZIiGO10uC6/Stb7kokIBHg40R4wcqYEasxE09XiIzCAphB6n
         WGBpFIIGcdNnYRlil0EQ1rpwUMYLnscThiqSQh94PzUmqUo08Jkp/w9YXAkwaOjl5IO/
         dF9w==
X-Forwarded-Encrypted: i=1; AJvYcCXbHerHfveTh3dB5xjCTucLQAA7IPdDzO/nrG2U+TPQD2oGODirvLKkYvqRXr0EKHK0nb7F5XQ99Xd3/Hn34fDfdjLZePwJzS/Eoeg=
X-Gm-Message-State: AOJu0YxQorswSlO0srFxqY9qBACShse7jKrxleZONgKSyv7Jlopu2Zc6
	9Q0/1jP+flNnSzkOlpZBZl99p0IbUFxgO5q/lRC8k/u5ZWLHJir5iQU4TA==
X-Google-Smtp-Source: AGHT+IFAl4O1yBJNyYbJj9fZk4QnHCSt1N6houzz/EYyP5TB7e11xUSUZefrC3fu5k0s2lsjjeUD7Q==
X-Received: by 2002:a05:6a00:1307:b0:706:5dab:83c5 with SMTP id d2e1a72fcca58-70ba457cf3cmr584153b3a.0.1721067835244;
        Mon, 15 Jul 2024 11:23:55 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ebb6aa1sm4705205b3a.77.2024.07.15.11.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 11:23:54 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Mon, 15 Jul 2024 08:23:53 -1000
From: Tejun Heo <tj@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>, void@manifault.com,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: next-20240715: WARNING: at kernel/cpu.c:527
 lockdep_assert_cpus_held (kernel/cpu.c:527 (discriminator 7)
 kernel/cpu.c:516 (discriminator 7))
Message-ID: <ZpVpOTNCEn1LTuD1@slm.duckdns.org>
References: <CA+G9fYtg6tjSpVSN+OJRrSFhKcH5NkXVH7ccZMkXDpKjV5TYmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYtg6tjSpVSN+OJRrSFhKcH5NkXVH7ccZMkXDpKjV5TYmA@mail.gmail.com>

Hello,

On Mon, Jul 15, 2024 at 11:19:11PM +0530, Naresh Kamboju wrote:
> The following kernel warnings are noticed on today's Linux next-20240715 tag
> on the arm64 Raspberry Pi 4 Model B and x86_64 devices while booting.
> 
> This is always reproducible: yes.
> 
>   GOOD: next-20240712
>   BAD:  next-20240715
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Yeah, known problem. Lai is working on the fix.

Thanks.

-- 
tejun
