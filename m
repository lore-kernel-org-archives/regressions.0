Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACA258234
	for <regressions@lists.linux.dev>; Mon, 11 Mar 2024 23:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710200878; cv=none; b=QhXLfmrcEeJdM55Sefk4FM9dUdlh9oV7ZrRJQxtESQZGZSeI4P8n1B5EhiyyFrqflsfB5fuXxTjGlE7hkq4lx0niuxBpJbkUSGasPf7XhWYnIPwVBV8TvZcsYMm6NJFNsDHCX2it93KlRLGACOvN9T1hKaf198+66rTBCydnzuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710200878; c=relaxed/simple;
	bh=47I9y9d6m+sWHb20BjXAdG4iVoGGvHvr9MoKNbZqVB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgOTvR6F3gUqeTA/fOap1/yt5Bk+IuSLtDDIA/E19oD59jgzUKKMSvLntxCmylnGSsm66YRl6F7Rcm51CQZB9NfkLjjHSKtfVVy0O4UyPLfK+bKP8pemyWvk8cj1aGTdQaO1wChMRA9X6hUkArTnlS9hbgMgbzHYJwNSll1c9ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dJmAOrjC; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dJmAOrjC"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-566b160f6eeso1687a12.1
        for <regressions@lists.linux.dev>; Mon, 11 Mar 2024 16:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710200875; x=1710805675; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=47I9y9d6m+sWHb20BjXAdG4iVoGGvHvr9MoKNbZqVB4=;
        b=dJmAOrjCLxxl+Xhr4MDMd6pPYIYaZuwSTju4gphY6OxlU974TA7qCvmoxHr+EtdoAp
         mKisuqXtr0GIN4mDNkFe9sZJCoNaXRKSN0B6psIzfE4T+Q4BnP5PjjdT13AO+6BEMdg7
         IN9lhkQu9TrfBwjHWSZHXdp7AbpEfDuD5Kx/ZqE1WH2GfHJ+dU4rqgyqKwT1d4XGq5Tg
         Z0sAB2t86/gf8S5r2voLFHd5LP9ZMC6S6dixt1BROWe9QoOyo6ugXsQfeL+nRMFUFcpr
         P13DdOU9aeqUZVQg7BIM7Qck8XqXSAL0Zrg1Cf/l+RAIQEtHDsQEYOkE8x6GQecL02mv
         fwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710200875; x=1710805675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47I9y9d6m+sWHb20BjXAdG4iVoGGvHvr9MoKNbZqVB4=;
        b=vcKzwNJRAMj20aWtAOy4RHW2uY7YKAJVSmfiMxeaulqVGWJvv4ZVuAcTua2CSavFjO
         CBkP/bnnAI3Bs9zfP6amR6hYXKhnf2CkbFbVGI/+UheOx1j+nysBcxRExl11Y0WPyq7I
         AegATlGqrwBmFM21MoxAJ5t5B5TyXigRaqTHbK8jD3w16+4TmMCs/42WKHgFtJu9OAX7
         0NzowYW1lxnQhopLN9IX3IojKds/R/Cdqssq5X1buphV8pTpTmHQA10cMRsYQh//T0lD
         PoBmfwbhu3yBJocmRQ5RDLNwdotGW9CJHd1pOCd3PJsB64CLPXhOWTI/LzYXeBdj9oxL
         dnWA==
X-Forwarded-Encrypted: i=1; AJvYcCW/Nt7W75M5mGiQUKzrcrA6sQwtoC1jqGPaQ6l7dTnWGW8AJVLqCdFJhEIesQiBKmvrwa19CSJKRj09F9Qu5o+A8nZQCnNxVURvZaE=
X-Gm-Message-State: AOJu0Yx+ZPvJn38W9Vwg60eVmjL+uwdNm3G9JfC4g9px3DFpRdyEODVI
	Z97M43qP1eX0JNhkFy5T9mkOLaqP4SznQDFX8VoJALVamsC9o1V/CPf1txvZ0uw1/9aPvCEm9OV
	S3Q7BNU1eT527VS7to1EN+XaUyvWacuMZmDyX
X-Google-Smtp-Source: AGHT+IETgRPqiRPbjXlytKWnI8hu5RRmZmhuCnz7VkKXbd9crkp5Z06XYH+DNdrtU45ZfgOq+m/uFl50UP0/GeFNtkg=
X-Received: by 2002:aa7:da44:0:b0:568:55db:8c69 with SMTP id
 w4-20020aa7da44000000b0056855db8c69mr72961eds.4.1710200875068; Mon, 11 Mar
 2024 16:47:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240305025804.1290919-1-jthies@google.com> <20240305025804.1290919-3-jthies@google.com>
 <44e8142f-d9b3-487b-83fe-39deadddb492@linaro.org>
In-Reply-To: <44e8142f-d9b3-487b-83fe-39deadddb492@linaro.org>
From: Jameson Thies <jthies@google.com>
Date: Mon, 11 Mar 2024 16:47:42 -0700
Message-ID: <CAMFSARdZLnfUOZcKVFNCwq40bEZgk0Bo_Oe-o8o7iKk7gQ9G2g@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] usb: typec: ucsi: Register cables based on GET_CABLE_PROPERTY
To: neil.armstrong@linaro.org
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, dmitry.baryshkov@linaro.org, 
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Neil,
thanks for catching this. You're right, the UCSI driver doesn't need
to be sending these commands when they are not supported. I'll post a
followup patch properly gating ucsi_get_partner_identity and
ucsi_check_cable.

Thanks,
Jameson
