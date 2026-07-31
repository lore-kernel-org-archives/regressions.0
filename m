Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539853546DC
	for <regressions@lists.linux.dev>; Fri, 31 Jul 2026 04:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785472815; cv=none; b=u9PkEoSUR5xXhl5pZdaQHSUmH7JmdpiUu4smUuPMFt0lhaJVmgSLC+zdsFavqq5FG0lKWU8GjE6PGdTCnyqbLoidv0KCEJryjSYBIYLbccIwHk0D0/Xut+AHkLZqPazDV7Mry7d+2szRlyafza7A6zUyvRA3SYzd2iA8pzBYY6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785472815; c=relaxed/simple;
	bh=Tx5WmF3XryGiMbBuMhanT+WCPlnUcf1UK/6cuvejFps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ta8fuInDjsw1ka3wLdyC8v2KUe6EcOaWfsW1h+XqSSTQRDZuroeC0va9m3cHLKS9QFopVRTd915i+qGFYQaP6qe5AD/JPKoiESQDl4DBZhpZPdDTD/W1XHt2oJ3gZ3wVuWvI5jsRbda3hjOobzeS/iQnyldpwM4wjs9PePXxR1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWeqLA5x; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWeqLA5x"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6ab02abdbd7so253039eaf.1
        for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 21:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785472813; x=1786077613; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tx5WmF3XryGiMbBuMhanT+WCPlnUcf1UK/6cuvejFps=;
        b=lWeqLA5xtWNLqbuWlYS1mUeuNmc+gTx2iOUcMysUxvrby62QWowEUL7Qyc3n0gn9MG
         XK0o6ee/xYD6uvQavgkaxNYngkUKmU83HjMJddvmJIIzsvLhFZyaweniSSmlEiAJMCoE
         gkg+rpCnnLEAnjXPWLZw2YbboZI/KZ7JWwVl+sZcuHSv/vAnHtD63J/sX6TK6ZNNdG/j
         c2RczY+Rb4pN4kCGFBqnVcbOZebcKebeAE4IOK1XqmxAv9JDwZwcmNTnJVubrx62A34v
         loZS5Gnx3V6ZKdVYIqLH1mH4cgyprJC1fXyOHzEqIJc2W8uHi8u55O9XWDBA2XQecB7j
         wPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785472813; x=1786077613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tx5WmF3XryGiMbBuMhanT+WCPlnUcf1UK/6cuvejFps=;
        b=CZg/efvG6JIelbH6oztltfDpD+5+Rm0YKc8KnxWZw91R/9fJrRgGUvh+i0u4LCasZu
         KqsrbdMfW9ZbEFljK+ALdgRbueBEDRvlvEYoy9HyYE/4Gk+8kNqKlTXcwfZklGnRd+fO
         mEUfJUK25mohpQUAVdp9gIsMyMyCuCIIk/ZSN5AcTCVscsLWQC/8yItUxoxnDKmUgJc5
         ktkaC1UYJOMjtmKyI/3H13J8aznbbI/wUekLTSVs32xzYD5s5yn15yJ5ZUOafuTPb8me
         3KYZFLtpaRK3xBmLkAnzwzXf236LfIHHHbAdHM0vcinBo2HI1Ual5SrZMsaVr09DOhC2
         avtQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRu8bMLHScA4vL+WYWoi4EcvhWTfQsCN48ZtXl4U0Q1DTEcXVQiWqn4ecIlBJ5miRA3WDQEELrZ5SMHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwII30lp+I3mpLdYDwFo1rPSTutgE0ymaquxtf4TpCDS2Ofs+KS
	ZR1g/ODX5otC8j6ebH91hhgRXu6v9Yv4bpB83yX3KrVGoxm3kBSnMBfF
X-Gm-Gg: AR+sD13FNeK0oMzGNwumk7ww10f765J0iO8jwq8oz2fHjqujF82uefMsGyC4NiengqZ
	4EgWAgpxvFlrRcOJ4b5GDgQqI4Mvif8CiaPoAvzci0LGXkX194KDvIEHbEd+JRidXIyKes9dM2b
	EywIqXcEIaZCAW6Ns3eHZZWl4Fh8F9AkLPx5J/vj0dWmCI6gsLOBVBeu+XAdVynICtLR3a+b5Z5
	dDfxiz+ZSGLVkdWTgveqZT6EZ9JHKzSEc7nTp0CmIYWxYiDIE6jLzXxKkGGSKgU1XyYDGIPi0Kq
	ixxm21dqUXByp1KR1j8y1PAONaKMTIuIJ8AWXYZkhqy7iWTz9gVoIADti1pLTSOB971YwtxXpgH
	EA9i0zs523nnaTrR7l/2EDGeztxtBblWeOXFQICEUhfJR9U/q+oEYMlN+URNdq40m9Qb++o/8ys
	dMmh57KFcvkgQeKrT8JXi62fyM/aD0DM8hQuoinpt3NeV+BpVaJQgEdEFCeA4QTELj41l6
X-Received: by 2002:a05:6820:4c0a:b0:6ac:bafb:bff5 with SMTP id 006d021491bc7-6ae37d887c2mr312568eaf.11.1785472812985;
        Thu, 30 Jul 2026 21:40:12 -0700 (PDT)
Received: from [10.10.0.5] ([59.152.127.200])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458c2a5d539sm4218232fac.17.2026.07.30.21.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 21:40:12 -0700 (PDT)
Message-ID: <7792f017-42b0-4a09-9941-5259138e21b1@gmail.com>
Date: Fri, 31 Jul 2026 12:40:07 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb controller fails to initialize on intel s1200btl
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: rafael.j.wysocki@intel.com, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev
References: <3353bdf3-4f33-44b1-809b-b0378bee5816@gmail.com>
 <CAJZ5v0h1kqDEBYk0k05rv6f2SJ7g+TN4FhBDJYZSVUctu-0FdA@mail.gmail.com>
 <daf0bb9b-246d-437d-87ca-16706113b201@gmail.com>
 <CAJZ5v0jByxtQ2tmNm_ZyyBnDMBNjuqQwD_367NRyGNzF7wQtRw@mail.gmail.com>
Content-Language: en-US
From: Julian Silver <mendaxca@gmail.com>
In-Reply-To: <CAJZ5v0jByxtQ2tmNm_ZyyBnDMBNjuqQwD_367NRyGNzF7wQtRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-07-31 00:16:27, Rafael J. Wysocki (Intel) wrote:
> Can you please check if the attached patch (on top of the current
> mainline) helps?

I tested v7.2-rc5 with or without your patch. Both of them have the -110 error.
Note I add "#include <linux/pm_qos.h>" as the patch does not compile.
