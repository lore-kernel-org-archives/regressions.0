Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34561DF961
	for <regressions@lists.linux.dev>; Mon,  6 Jan 2025 19:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736192707; cv=none; b=OXeJp5GqPFbfv9ET5V07PpLlLTf/hEvB2XfVuLpezVARoUCNx8OC6v+37lSLP+OlUXZfBfz/n+ylxxAyDbRnFgS7N0TZaHuKZ61ax4rZOSwp6eJki+VT7BLY0raRphhM+W1INSR2l9PZJKohW4p05BqQY637uO1EIhj5HURHnpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736192707; c=relaxed/simple;
	bh=zQ3dDNxwAVqmUONVZQGHhMKpUxfHfRjY40yicSGUeAQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=uq4MiASenpT9+NI1xOrA2woZFs/pYTPZj+TwF8BouQtN5tiR/BqEgL5wRnaC+RqygvUrsxXQsMiUazhaLzYj9KBaGc0T6Uo8x8UxVcykqgAREUTiPqMW3VbAHD4x58pRFFuE0sDp3oimzNewQw8EysXCkgUd21R9/PCKMaNOA2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JGni4XYg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JGni4XYg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436341f575fso152668815e9.1
        for <regressions@lists.linux.dev>; Mon, 06 Jan 2025 11:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736192703; x=1736797503; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0aLwuHOfqts1r2RamlRiGd6YK3rscuDAhXgMPSkYQ/I=;
        b=JGni4XYgol6py+3Vp8kxApXC78dMRTIdI0xcdZTarBKHLpEY8FFiGREJ5+uV+0Qukm
         kfj9RMkgdVbmBHV57ciDYWdIK98VdOzwMErzJMT+RWnlK9L2wHXq96jBf8TwsiRveX/F
         Wlm/+dPa7KqT7gHrwEssrJrMsmHS3qLdhRljVYyLOvRt2TR+fo4/u2wWPu44QMHpadIx
         Qxv0H5J3oVuGnJNS6UeCT+3Ofpn+LanZRwabSRUWomkWIJsIaHjqdPfO58dPSu+4RwLs
         Gc/5JU3D4zJEUpGMC83vIuVC06o5Q+5QbyCFfBiWqnh+OjHf2wQHB7hjfeODiwkJ8Pzs
         NhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736192703; x=1736797503;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0aLwuHOfqts1r2RamlRiGd6YK3rscuDAhXgMPSkYQ/I=;
        b=F37Ft9BagHFQze7UvPgjVdFgaPu3SIjtW1kBVHtbx25zrWxYp2gwI1qrTBe6SykY2k
         6D81+xvXwbIIscNOUhkEcLSu+R9Kc4E9TKRY5/FNeDrYnZATUzFn8sPx64ylTSePmKMn
         F3pNCYyA5/dGmkPgZ9lz/rEOAo3Z7gEupDunAO8TbQ5MRME5NrA6SeUAD8sPC+U2MhdO
         tEXgG62Xf/2lqiu81yuvnEN/4HKdwm7bM237KbdT+rsOUYYx1fDjvOtHfIUYKxscCxEi
         W1rSPJ3kQdV60eKA7VWsJW/7Oh6DnUuawrnrpH1jYO9s0YFRomK69mmxiwJYr1wOgYbM
         C98w==
X-Forwarded-Encrypted: i=1; AJvYcCWp9S0JLz2HkK52QUuQV7KGfZu4xaeClCCkk2A01Vc6B9X+oBbHWV+KKJoVWHTrDYdmgiDWsU8LwCGyRg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd6hobB0m7A3YLotX27meqMnvIMgqVwQHgr+AVlPheAMKzcGez
	pvcew8HiHjY3hldCfCyaRHVhq42+uvP1RqEhBxPNAkP+1t/NqZUVpt0pcxiMYko=
X-Gm-Gg: ASbGncsUatZwmf3W9ACGJikzcMOT+DoFUO5Rs6N5oaakL+J09uk6IZgvTwmJOLHVWiF
	XdmT6lsQ42wNMCsemyjj7Wyaye3w1iHfz+7A0DkDTmOR2peDbtQYgKs6lo1sjudeIOWHTGVJZHu
	iuTyc/1x0OoO7UOefYlEOpzYxJMuIHOeyPy8yo7qVQ6zJQgldRKK26pDmIKUkzd9cLWC73loEBd
	dC1LKoytQXyTMj58K01nqTTj5DwIoBgodU8AIrJFmME8sJs22z9PZCxjqmr
X-Google-Smtp-Source: AGHT+IH2BY0sTS8enQiAP1KtexhKyJ6/pVUM0cYmW/vvBj8QsCYf2kLQBIcE4NYHTcKNybVDe0O0QA==
X-Received: by 2002:a05:600c:3b13:b0:436:488f:4f5 with SMTP id 5b1f17b1804b1-4366864420bmr511100335e9.19.1736192702985;
        Mon, 06 Jan 2025 11:45:02 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b013a1sm614843995e9.11.2025.01.06.11.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 11:45:02 -0800 (PST)
Message-ID: <0530eee7-f329-4786-bea3-c9c66d5f0bed@suse.com>
Date: Mon, 6 Jan 2025 20:45:01 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ROX allocations broke livepatch for modules since 6.13-rc1
From: Petr Pavlu <petr.pavlu@suse.com>
To: rppt@kernel.org, akpm@linux-foundation.org
Cc: =?UTF-8?Q?Marek_Ma=C5=9Blanka?= <mmaslanka@google.com>,
 mcgrof@kernel.org, regressions@lists.linux.dev,
 linux-modules@vger.kernel.org, linux-mm@kvack.org,
 live-patching@vger.kernel.org, joe.lawrence@redhat.com, jpoimboe@kernel.org,
 pmladek@suse.com
References: <CAGcaFA2hdThQV6mjD_1_U+GNHThv84+MQvMWLgEuX+LVbAyDxg@mail.gmail.com>
 <c37395e2-1ab5-4175-9920-5144cf60e25e@suse.com>
Content-Language: en-US
In-Reply-To: <c37395e2-1ab5-4175-9920-5144cf60e25e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/5/25 15:51, Petr Pavlu wrote:
> On 12/30/24 01:09, Marek Maślanka wrote:
>> Hi Mike and others,
>>
>> I discovered that the patch "[v7,4/8] module: prepare to handle ROX allocations
>> for text" has disrupted livepatch functionality. Specifically, this occurs when
>> livepatch is prepared to patch a kernel module and when the livepatch module
>> contains a "special" relocation section named
>> ".klp.rela.<MODULE_NAME>.<SECTION_NAME>" to access local symbols.
> 
> Thank you for the report. It is possible for me to reproduce the issue
> on my system. An annoying part is to create the
> .klp.rela.<objname>.<secname> data, for which I eventually used one
> floating variant of klp-convert [1]. To hit the problem, <objname> must
> point to an object that is different from vmlinux. Such relocations are
> processed by the livepatch code later than regular module relocations,
> as you pointed out after mod->rw_copy is already reset.
> 
> I think the bug should be addressed in principle by Mike's recently
> posted rework of the feature [2] but unfortunately, its current version
> makes my system also unbootable [3].

A simpler fix could be:

diff --git a/include/linux/module.h b/include/linux/module.h
index 94acbacdcdf1..b3a643435357 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -773,7 +773,8 @@ void *__module_writable_address(struct module *mod, void *loc);
 
 static inline void *module_writable_address(struct module *mod, void *loc)
 {
-	if (!IS_ENABLED(CONFIG_ARCH_HAS_EXECMEM_ROX) || !mod)
+	if (!IS_ENABLED(CONFIG_ARCH_HAS_EXECMEM_ROX) || !mod ||
+	    mod->state != MODULE_STATE_UNFORMED)
 		return loc;
 	return __module_writable_address(mod, loc);
 }

Hm, is it expected that Mike's rework to drop rw_copy will make it into
6.13 or should I properly post this minimal fix for review?

-- 
Thanks,
Petr
