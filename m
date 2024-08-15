Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F50542052
	for <regressions@lists.linux.dev>; Thu, 15 Aug 2024 17:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723744296; cv=none; b=pzUsspqet1F77alhc9Ds4DZDjO9BivkkU3l1kUS46ENOWtkSUp7oWG1Ce9j6T57iXstar2cWG/feicf3xCT5HdWmBKxWVFgzF9kPst87V+j4zFaJr1O/DHtXmZP3tXNq+kKhISbRK67KlYkouP00MIuU5CtoPonTuCxcZt1zae8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723744296; c=relaxed/simple;
	bh=cHk85tyT4WA9zUGQ8DCybEejXHfLNg19pRozx9IMQK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XaKlstsxRUl3aYpV7P9AQW2VqZv1UDxMRqrXzGQQmqjo1ZPsDGrcR+cE2GUeaf40tlqS4g6ySRktv3Y5ixODarHuncAAJtCyA7z05FzNNuzcdogk76UekWLn+ZyfwtCAHyqRRNb4ppp7HIyZgcmIuNbQGvMjqIXtzrzdVyf/r7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grsecurity.net; spf=pass smtp.mailfrom=opensrcsec.com; dkim=pass (2048-bit key) header.d=grsecurity.net header.i=@grsecurity.net header.b=rArk3sN1; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grsecurity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensrcsec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grsecurity.net header.i=@grsecurity.net header.b="rArk3sN1"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5d5b986a806so1237549eaf.1
        for <regressions@lists.linux.dev>; Thu, 15 Aug 2024 10:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grsecurity.net; s=grsec; t=1723744294; x=1724349094; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cHk85tyT4WA9zUGQ8DCybEejXHfLNg19pRozx9IMQK0=;
        b=rArk3sN1n9pIIvj6k9ovu/pyQ5gnPdT9jkxldt7NbJw8qchewb7Gb19doJzsgFB8mg
         hRq5WOM+XKLYToZ6gGoug9kIO6olxWA62lfc+EgrIRBNitn8juiCkYzQJIfV6OPedzKl
         lOmDi7XW93gsifnqsh7EW8Yz6MXjJhG8wQmU0Dl9EN3oSYUts2auOLtGRMfjFxmUiivQ
         oQbyrefuX6iKZmf+kWoz5nD7bc4Jfuwigb76UI/suKuN49/V48hAEWnFm7Wb4HtC3NjW
         YiGwp9G4KTgp6TSfrn64PjhQU9P8zPOqXpZX8k3luI/IuyU0y7xrvBDOHVQH1KuqfZiY
         Y8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723744294; x=1724349094;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cHk85tyT4WA9zUGQ8DCybEejXHfLNg19pRozx9IMQK0=;
        b=gO5pwMAPNJitMzv+74KZoNfCrj3ks0WiR3fZmABMS+Ezo1OyWdRkQWwdlmyNGbVwjM
         2r4aChTKn1C+ZaotXJyNQQ2bdF9ARohLAXbEuCIw/TXGxLETOtV2in3+R98m5t1RzC0c
         qXE2Ae4TI1HAbnvw3TYbJgBqo7Wk3JR2UWi8far/BRC2lPbTW+XsTvmXaVAGwRc43fOV
         MPHenSmq8LnI9+JXj6xoNzsoqW8OQ7LzLDY2duJDh179nzxyjKfh1wNUd5X32L9mLZuU
         IFIlFbldNbBkGbe32wh898VUwiO3GLbXNhUWBKtKFwgx9i+Ax79jUHGLPb33gTpSTMYu
         HiKA==
X-Forwarded-Encrypted: i=1; AJvYcCVmefq2qeyZJXCB3SdAk05BQGby4GC8GMuz2Zl/KggURa8IVRi0v6pDvevMs/WEFYz74SltcFSOLpi/H7h44w0j6k8ysgQz9rob+d0=
X-Gm-Message-State: AOJu0Yz1Pp7LUnBtwBztpWgpn5SbgHgB6QCgZ4t6t00nZuOEa6GMPxhq
	JBZIWgTpufW2yAa9/w7FrFAAMV/tRf7oZMZXTUGCny8PU/j5Ht5sqlV/aplaKOzUr3hmol2nuVC
	dOV/3aIkWAJiMLU6b/djYbYW2cuBwvb/Q1aQ17g==
X-Google-Smtp-Source: AGHT+IG50L+pt6CMEi8/UvxulV9JQjtG8Tp+1SY2FYA7cK6hMg11Oau24F83MwbxIf/cYbxTOhn+EKgTCyilqSQtlLo=
X-Received: by 2002:a05:6870:9346:b0:261:900:b222 with SMTP id
 586e51a60fabf-26fff648042mr1529797fac.20.1723744294324; Thu, 15 Aug 2024
 10:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0d0330f3-2ac0-4cd5-8075-7f1cbaf72a8e@heusel.eu>
In-Reply-To: <0d0330f3-2ac0-4cd5-8075-7f1cbaf72a8e@heusel.eu>
Reply-To: spender@grsecurity.net
From: Brad Spengler <spender@grsecurity.net>
Date: Thu, 15 Aug 2024 13:51:22 -0400
Message-ID: <CAKnqPui5XSBgxPA0Jh9UEv72aVr1uvFqoNeON6RB-YZUj+Fr=g@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] vmwgfx crashes with command buffer error
 after update
To: Christian Heusel <christian@heusel.eu>
Cc: Zack Rusin <zack.rusin@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Martin Krastev <martin.krastev@broadcom.com>, 
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>, dri-devel@lists.freedesktop.org, 
	rdkehn@gmail.com, linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

> While we were still debugging the issue Brad (also CC'ed) messaged me
> that they were seeing similar failures in their ESXi based test
> pipelines except for one box that was running on legacy BIOS (so maybe
> that is relevant). They noticed this because they had set panic_on_warn.

Just to clarify, it was actually the inverse: all the legacy
BIOS-booting systems triggered the warning, and the UEFI one did not.

Thanks for the report!

-Brad
