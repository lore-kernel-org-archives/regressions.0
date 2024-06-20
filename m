Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5FD1A4F2A
	for <regressions@lists.linux.dev>; Thu, 20 Jun 2024 13:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718888792; cv=none; b=hFNJ+AoZ0gwheBh+WPwvdgKyO9KSC1EW87ALcHPrwz/yPE05pi8XPC/gE2t+voR6Z9tNzXR6o+7mpAq+p96AwB3lF1xnBvYaI8BtGmeek6nLvJBae0XeaAAfPfqA1NQhofO4pxIW58fbgYrSZyptqRiwbdcOKOKRV5rLVI36A98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718888792; c=relaxed/simple;
	bh=U/Vzc484+V4lv4x3ivcc/NCSIiHpY+euyvJkYjGSyoM=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=LJ+lqWdLJi7CdzmIHEBwcI8T0pXIG3HBxaR98RHYGk4QWnZuHSxulmNaX1yh7EZWDaoZwvl2Q1vdM2RwmLsqh5RnjLTqTV3HJA19hBvf/O8Stha+QHqJ9X09NbrfNZHL20r4nG6vfH/BmLEeUrYpkbZOfVKk+UGxurKTQrC1K1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckMqrp5U; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckMqrp5U"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f9cd92b146so5114405ad.3
        for <regressions@lists.linux.dev>; Thu, 20 Jun 2024 06:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718888789; x=1719493589; darn=lists.linux.dev;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=U/Vzc484+V4lv4x3ivcc/NCSIiHpY+euyvJkYjGSyoM=;
        b=ckMqrp5U5w85UGpcKQG76i0KweGzjDc0LA5kaRILN6WarAFOIjWRnkaUaDTNGZmsEF
         zDe4As3Y0G+G6wzbM2YtoqTiq2tueItEoMbY29HyxPcNJjnWeczyhosADmPSxgFB4RyN
         h+covhLCR/lvzk4mzKGDQXB82uBbCqf/sf4CQJcMSQlTMwsUOQH2+FQmwbzu3z1F/17u
         Cy49w0Lm8Zjit5eIgSPYvz9GjP0/IRN9Nc9vCKWGCGUe42T6xctheAOllPjwI8lmzRG6
         w2CmMjsjBPb38x+YKZPoHj89YvaCU1eQemdtYHURJBKhjA/2VWSHqyBV+jVJY3PtjCm+
         3QsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718888789; x=1719493589;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/Vzc484+V4lv4x3ivcc/NCSIiHpY+euyvJkYjGSyoM=;
        b=YhKFYMEETb6HBx+zM6ksJVZlFzDgBoqsNvARKsuIWFdB4kznosFVqI5kvBef5mGLFU
         L9kNXuV8bdmzkNQfKP23fRrbFDoogxv6/NuAwdZ3wuKrljYkJyYzEpSUQeO39glw0PI1
         HUfoKpD1OthDYZr5Si+YKhfJJ/FsiGvpgv8R1h+LmZF7I/GymxKRdgfg+cqLyS+wkitz
         gTe1c/wUcjrrvoqTMVXDNVBodGivOyVxTt6WQURFn0eWAeCt1nm5pRDjjKeiF04y6IKH
         zbzG0qUEWMhzAYzw3oGMhSgIJR1qPPO/L57kz0jK2LRJ+ioa5iQL4xE2BlvnAP7Sismq
         JM2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtAEmTl++npELav7zrSfPY+/uUL8AWp30SUwF6Z/qG13/7B1c/pJhQGUbPRIhk5pV9+2a49eqHToSiGK/B92JggCf7QjRnJ6KvvxI=
X-Gm-Message-State: AOJu0YwdA8OsHp7aGm5uO3aPmPFxw0J0tFHo1kNm/aKd4UawJp+/62Y1
	x8XsNp6m/vQpA+DhzEuSVhIxuTd90UCLMmXAQOmnNVx8e+dGL6/0wsiuEy6krgg=
X-Google-Smtp-Source: AGHT+IFWZjnmSAWvGOgm2kZzT3GlgTGUhE3W9jMnpBnvaQnIigpbklefAahul749zLDiOzMOeBMCiA==
X-Received: by 2002:a17:903:1cf:b0:1f9:8cd9:96c9 with SMTP id d9443c01a7336-1f9aa45a571mr55098045ad.46.1718888789187;
        Thu, 20 Jun 2024 06:06:29 -0700 (PDT)
Received: from terra ([122.171.17.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855ee8489sm137619945ad.167.2024.06.20.06.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 06:06:28 -0700 (PDT)
References: <87tthpwkqf.fsf@gmail.com>
 <2ce41d4129234ba9a91d5b4dcd8a40ee@realtek.com> <87sex93s63.fsf@gmail.com>
 <6970398610c546b1b62e599902c67572@realtek.com>
 <E3FF7BC1-725B-40E2-AAF0-CA41A44B9DF9@gmail.com>
 <342b6b95d97a4bf09afee15c09481efc@realtek.com>
 <CFB0314C-AE45-4563-BF41-F5D635BFCF86@gmail.com>
 <a60692b7a0ec4caa5db64d369bebf18910102656.camel@realtek.com>
User-agent: Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101
 Thunderbird/38.1.0 Lightning/4.0.2
From: Forty Five <mathewegeorge@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "kvalo@kernel.org" <kvalo@kernel.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, Bernie Huang <phhuang@realtek.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Freeze on resume from S3 (bisected)
Date: Thu, 20 Jun 2024 18:35:24 +0530
In-reply-to: <a60692b7a0ec4caa5db64d369bebf18910102656.camel@realtek.com>
Message-ID: <87jzij7ohf.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Ping-Ke Shih <pkshih@realtek.com> writes:

> Please provide output of 'cat /etc/lsb-release', which Arch Linux version
> should be there, to me.

I don't have that file. But I do have `/etc/os-release`:


NAME="Arch Linux"
PRETTY_NAME="Arch Linux"
ID=arch
BUILD_ID=rolling
ANSI_COLOR="38;2;23;147;209"
HOME_URL="https://archlinux.org/"
DOCUMENTATION_URL="https://wiki.archlinux.org/"
SUPPORT_URL="https://bbs.archlinux.org/"
BUG_REPORT_URL="https://gitlab.archlinux.org/groups/archlinux/-/issues"
PRIVACY_POLICY_URL="https://terms.archlinux.org/docs/privacy-policy/"
LOGO=archlinux-logo
