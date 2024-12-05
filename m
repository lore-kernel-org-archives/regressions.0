Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6572227BB6
	for <regressions@lists.linux.dev>; Thu,  5 Dec 2024 18:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733424137; cv=none; b=t90e1K6xeGBZ16a4LrJncBAHB5k2k+CgwfmkwAImNRjlpGy3ft9iUqOsK6OFDXVljJ9z8wwXNNVQ5+CzMKTBvXNK0jf7yniI4Y1F+nGds8yxw27qm9tdkfQ2MdmZji0lTFx75tEaT8mqJYVzSJP7RblbQU9bj4t6aoEDfOlwYD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733424137; c=relaxed/simple;
	bh=gA/VeNm6V5/8b09vX/49ut5uvV/G8q+I9tBmKj7pctU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MoFRRyvdRa7gQaVPB5FExqo+wOo1XZBtVEAYE28ZTLYTPUYkZZOIOID0LCJoZtbvAhwO2AezJxRf0eRBOY8ZDoSZdQbwFI3cwy/PQXkD+VKVMlKS5jFtuPL6QWJmjJ6MvHNT9iyLGnf5nsAPiH3vdxOon4oLVxDj/jGBEQFCtdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E9wfeQBs; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E9wfeQBs"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afbf632c82so242772137.0
        for <regressions@lists.linux.dev>; Thu, 05 Dec 2024 10:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733424134; x=1734028934; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tR8Gx4YF+iGaCMV6DuY+XQYSDcjVdzyIfn9PDc6LDOM=;
        b=E9wfeQBspvXhFN7gJF0nbv0a0W42kBC9eD/TsZmmuv/9FSIdt/fZ/D02PjhoVFpWxb
         Rs0PN+k66sLQkoPjcjCRj7xBJ3CuNJHj9Qn+ujD9koMURjUW2RezyyuvKb/iCrjz6PEQ
         SVTohdJ9/prwCTywv93Ys02FU4PVRD6Yrx7NcqgC0Djpw7yzsty7aXOVCP+FQEXSW9Kl
         iD5dbp2fZeyZPN4PPenrJwPzb5+yfd8qB6a5Dd61J5NGyzut1TKjE6TIBWB+7MI+hCwB
         aI3SLV5aTc2dmTJf7vdZMWx/Fu7Z8wht2hcDLyuQEynSWNR+lsfdzsxPD1yCeCSNqyP6
         dAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733424134; x=1734028934;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tR8Gx4YF+iGaCMV6DuY+XQYSDcjVdzyIfn9PDc6LDOM=;
        b=tnBJ6VM9+6JBQkRpiXwyBIomrenu1KPr9ourc4vkyxzK4V1/o8dVn+CNYH5pXHna2r
         6XeFFDbn3IytlzgVyBFlrmmSNt+tgpyYNdey8VmXjqOFVPMXzvyhv+h0bvqPG6Kpg4By
         4eZsNpt5suy/mzkvnsqyTjF46syH01MIwBoDo/P3qc26vJfnjzKJo2h9g5TjTRJPVZUR
         Eonbp08W54nlUlyBS+PYOsc1HfbUdIG/l0wvGSzaHgVQwRSlR9cDvcjTYBXfiF8DEw0S
         +UU8didsv9W2aK7BkLxuB+caVPsqX4WMdv/JSVKjjI8kgFtKVkQrQGs/45KUuQRZehOe
         Z5JQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0WYd/bw4R53mPJDT+d5ru4enJ0mjsupi1wqUV7tclW0O+HDNIQzOHBWNLJL9TthWDN6n9S5FUB99A2w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzeE75Vxk/GspZRtB5sbEYe3RR3tM4s5okWID+QAkdcTuKTltQ+
	i1XaB9WomY4Q/uUXb/ZGrY7Rb+s/Ntsf8d5wJcGlt32WCDAgIlzX9ZrGVGZPYBJdXDOlE+LT7Pp
	+1aFdOr2D8gwxssqUyS0xVu+FL9w+WFuB2wL3cQ==
X-Gm-Gg: ASbGncs8Q2jxjoKfg9BvXVLCdQL7XBG3LY0BnQ/YcU+1taludmzpo2R8SdeoUjwtold
	eLZjhOoD/eWG8+xBkmRJEoAB87EOVbjur
X-Google-Smtp-Source: AGHT+IG269PkgdVPpsUfRMnNfyCTRw+6b9s1FqQamygLLFlRX39CxuzaR647OcbZrJKkKII8mvW1s/GWCnxsPXgxkTM=
X-Received: by 2002:a05:6102:3909:b0:4af:bf45:39a8 with SMTP id
 ada2fe7eead31-4afcaa4f74cmr835447137.16.1733424134670; Thu, 05 Dec 2024
 10:42:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYsT34UkGFKxus63H6UVpYi5GRZkezT9MRLfAbM3f6ke0g@mail.gmail.com>
 <8dde5a62-4ce6-4954-86c9-54d961aed6df@stanley.mountain>
In-Reply-To: <8dde5a62-4ce6-4954-86c9-54d961aed6df@stanley.mountain>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 6 Dec 2024 00:12:03 +0530
Message-ID: <CA+G9fYv5gW1gByakU1yyQ__BoAKWkCcg=vGGyNep7+5p9_2uJA@mail.gmail.com>
Subject: Re: arm64: include/linux/compiler_types.h:542:38: error: call to
 '__compiletime_assert_1050' declared with attribute error: clamp() low limit
 min greater than high limit max_avail
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: David Laight <David.Laight@aculab.com>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, netfilter-devel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Johannes Berg <johannes.berg@intel.com>, toke@kernel.org, 
	Al Viro <viro@zeniv.linux.org.uk>, kernel@jfarr.cc, kees@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Dec 2024 at 20:46, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Add David to the CC list.

Anders bisected this reported issue and found the first bad commit as,

# first bad commit:
  [ef32b92ac605ba1b7692827330b9c60259f0af49]
  minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()


 - Naresh
