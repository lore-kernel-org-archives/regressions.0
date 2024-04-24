Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9022419479
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 18:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713984837; cv=none; b=sutaXEnlbalZgdjarvyT+A8FJWz1R6/1xYhur866XfcqZSkvVG7HVDeRKDpifY9szNp7wvK6V3b3Iofrgq/kND6qNqad9gvDWMmvT4tyTVS4SG88V4FuWD7SN6/t4BPAbmOPXs4MBe/hd4GhNzzloUm8iiad4WxNwhU1ZrlKNNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713984837; c=relaxed/simple;
	bh=L6t8/1Otid03POwko1fB2t8xd2r0RXQVTBsaux3bVhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M5h8xw1oXqSdyjSooMeVLht02OkkrW2Bz0qokHOteLx3gCqcVi1f013awCr7/OaAqpMmsWqStMjzkSf2cjXH2WKnmvX0S2qT2yySrYrHBmHX5nAO3yNMY9wQPOxCkzxQXITPq4A3FsL4IFTi0/ijAmwYV3FH0bu0nhXIdeD6Yik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=W3fA7S2E; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="W3fA7S2E"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5176f217b7bso287220e87.0
        for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 11:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1713984833; x=1714589633; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AMR/e3F+Pk4bn/6/mhO/XEfDpxEpt87AN3boxF73T/M=;
        b=W3fA7S2EfjjtjoCLL/fFJIJV6iqc+4gU5xDgfek9+K0OdIKaFNW0oSawf7ZJcBk49o
         1yFIixWxqpHsyNrvSFx7e3o3RzzGYpNC/jD205598iSqZHgy2U3b8w8GJLeLLefldbgQ
         WBpvsCXKePvuPBQKUJclOlIFm3GX+1hmpbfjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713984833; x=1714589633;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMR/e3F+Pk4bn/6/mhO/XEfDpxEpt87AN3boxF73T/M=;
        b=HzYT0fN5gRTqyr1e4ihNGu/yATfC+LIdVEoEMvh7k0ye4k8zmUw8YwHDPigJOJrWjR
         7mjGxS8fu32x6hBVutOtdKEwcEEN8xhvVP4J8TzahmfYdkiWLDMZ4m4zKkRs4XVk2S+7
         vvVUt8AdqpobjHBDN+hsq3ykYlDVkcRzNSc4b8JipS1+lyW3QotZ7C/52kqE8hIjOYWy
         KMlTUwjLRfkd8DQkk6wiL+TRs1/Fd0jfDkIKnvxfLREC+jeLIJ7cWtpTyLFd+oqjux8t
         8RkisSNZGelqpPiY5nHhYdVdRrl9QTc0GD3/1gRM3scHFLuomCQ8KYpbUQRnBAbTVZyA
         eiRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUne008ePOsC7WhsIlVR/z86CuMLuN8pZxLGWvg0BFTr1eR4PL9znwJ/st05OAxHNxHJssKrTGDpU1heTuNoalJ+CMONqPefGosl4c=
X-Gm-Message-State: AOJu0YxgdZQ0jmaGbyL5BM5NZU/xG1sxSyTcxDoNWrhuHhg+f2npz6ch
	01f5SwqlUeIW6A2VmNDoZg/C1fkVcJP//cKCCvxyVrWzgK+VmcsqC3Rp02m6VGgHahDgFY5/is4
	ZLd+fWA==
X-Google-Smtp-Source: AGHT+IGCAyvVJqhYqgywlfD5lPaqgfCPcBE5qCqM8GwkFCEOLgd++pZ+1mM+NeXcOdFVvaWsWqK6EA==
X-Received: by 2002:ac2:5049:0:b0:51c:1657:b04a with SMTP id a9-20020ac25049000000b0051c1657b04amr1252813lfm.63.1713984833691;
        Wed, 24 Apr 2024 11:53:53 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id u24-20020ac24c38000000b0051ae53e9affsm1641895lfq.252.2024.04.24.11.53.52
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 11:53:53 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51abd9fcbf6so226633e87.1
        for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 11:53:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXrqy/DBFT2tEevGEGPSm6EH5LtILmcvHK2JuR+yk6dZZpM2+bC7cyf1siw5Tvkv87d7cc+t+qIFQvYFFrYD4PcdahqIO51cmH70Ck=
X-Received: by 2002:ac2:5938:0:b0:51b:c43e:ea84 with SMTP id
 v24-20020ac25938000000b0051bc43eea84mr2412368lfi.55.1713984832182; Wed, 24
 Apr 2024 11:53:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240331182440.14477-1-kl@kl.wtf> <14d1b38e-0f11-4852-9c52-92b4bedb0a77@leemhuis.info>
 <CAO-hwJJtK2XRHK=HGaNUFb3mQhY5XbNGeCQwuAB0nmG2bjHX-Q@mail.gmail.com> <a810561a-14f3-412e-9903-acaba7a36160@leemhuis.info>
In-Reply-To: <a810561a-14f3-412e-9903-acaba7a36160@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 24 Apr 2024 11:53:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjy_ph9URuFt-pq+2AJ__p7gFDx=yzVSCsx16xAYvNw9g@mail.gmail.com>
Message-ID: <CAHk-=wjy_ph9URuFt-pq+2AJ__p7gFDx=yzVSCsx16xAYvNw9g@mail.gmail.com>
Subject: Re: regression fixes sitting in subsystem git trees for a week or
 longer (was: Re: [PATCH v2] HID: i2c-hid: Revert to await reset ACK before
 reading report descriptor)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Jiri Kosina <jikos@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kenny Levinsen <kl@kl.wtf>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Apr 2024 at 09:56, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> out of interest: what's your stance on regression fixes sitting in
> subsystem git trees for a week or longer before being mainlined?

Annoying, but probably depends on circumstances. The fact that it took
a while to even be noticed presumably means it's not common or holding
anything up.

That said, th4e last HID pull I have is from March 14. If the issue is
just that there's nothing else happening, I think people should just
point me to the patch and say "can you apply this single fix?"

                         Linus
