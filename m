Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BA013DDAC
	for <regressions@lists.linux.dev>; Tue, 26 Mar 2024 23:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711495194; cv=none; b=rGdC7eIfxsHSbfD57V7lzp6IXlTxiURju//YKr/5xC5RgIoyNZeSrZADY/gLMij+LrFUgGD/jRPT2hzwFZzhn7uxXSsx+ZtexlDETdrFkOYT+LT9FSH5JrZxCWGBa6sN2ZmVL7Z2MYCBpfUObLQosqdEAjKV1mGO3HYV9Ebi6kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711495194; c=relaxed/simple;
	bh=UvWP6b18kN8mm8jE4MtS1uYsAsJWVUOJQTXrlWh4/Ww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NytfoNdYdPgLg1Ew01hg522y1H4ZbE7lS1CfBqb0VCQCDuI/ip6BImHVO7LmJ6138Z4C6ZTnZwqcukaD/BpF3+4KH9yw/QX+R9GCtVJzjT9i6tH24KJ7vDDqIIUxmOV1XBWsXItLCP7Wasv1GNW8s3HL2GiujPdxb10b4NJDS3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tT2x/6TK; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tT2x/6TK"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56bde8ea904so4031a12.0
        for <regressions@lists.linux.dev>; Tue, 26 Mar 2024 16:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711495191; x=1712099991; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UvWP6b18kN8mm8jE4MtS1uYsAsJWVUOJQTXrlWh4/Ww=;
        b=tT2x/6TKDss5rb4yVk1KqN9R1fUM8D3HRCsJ20DFlhFrjrq1N0yhSlwxxlMn66ogcI
         7QtXoeO5A8fugxANjujDJnX+kx9cNBD/V9Y7y7oRxWy7Bajcrxf+bofYv5eKwreJIUJ/
         1J9Gp9k+FhqWifKQ87FvOM1umHRHNu3fQpt6uj3JbrtiagGkBNak2XXwj2HteXPvICEt
         n4Og6I2tBTNQBlhPoiPVjdvHZ2gTKIxASi7uUASzZR56qxu2s0QW6sxW1LDq5YF6DxgP
         lbK0AB1KbXoTW8S6XZULUfsaxIP3IL2SjKjzrKwArK++s5+tfcNZokdl8IJC59P3gVhN
         Yofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711495191; x=1712099991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvWP6b18kN8mm8jE4MtS1uYsAsJWVUOJQTXrlWh4/Ww=;
        b=Pdrr01s6GzgEjWu2prFRF1tTKIilMUhXx0jtrPOnOkdx492EaCl2MjS74/KRg/hBYw
         35hUaUqTH78+7gTB0BPncXFUCSKzH+BnYabOmO/9gqHvW0H7nm968tQWuy2SmvvYuz1t
         YwcVo9qDIhbeXJu7eM2iFBhE23SCjMDqlnaW3cQb/TYRcllZyKYYHGgeP9Swemz0/f4m
         qO4FTkq2PdrpYT7kHl0jocehqhbO0ur3zX6N5993jFVGaBa69sYjXTu6rXgk22T9a9KD
         0HM321QmBeLRbNr2f0fOWteGjKp1kuJZMK9+SEMI3hXRkEcKZPulnuK8iNtm1vT1NeHl
         BWyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHAP2q0YwCQQ774uW/88sJv/33CZFdPUnM3MXLiZ1CFgVgjN+lcmqGPFSXnmAVjLTAC5hFENRygQpOjBQL7SgWipaOPDahfrsH7UU=
X-Gm-Message-State: AOJu0Yzl772Z9EaQzEWcLgWLkT97uZcFshhdHQHzZoaieLris4wQNTxc
	X9nwI7uoig3FkbZ57A0EFUZgtkKYBRSrMVt1F6B9kcPbMj/cLj2+mYgmBCMav3hBs6yv7zmPfI0
	YYYFbzfTM4nh+fsiZ1hmNbczHFohj5lnOzcpm
X-Google-Smtp-Source: AGHT+IGZWut7iYxsRXsNc34sf0qz5fmBiwVI3r+NknfdcTh9appFJDXacDvZoJGMK/rXWQcZT5jiuuBFscfiEQScH5M=
X-Received: by 2002:aa7:d910:0:b0:56c:c20:6b40 with SMTP id
 a16-20020aa7d910000000b0056c0c206b40mr19214edr.0.1711495191346; Tue, 26 Mar
 2024 16:19:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240305025804.1290919-1-jthies@google.com> <20240305025804.1290919-3-jthies@google.com>
 <44e8142f-d9b3-487b-83fe-39deadddb492@linaro.org> <20240326220919.GA2136359@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <20240326220919.GA2136359@hu-bjorande-lv.qualcomm.com>
From: Jameson Thies <jthies@google.com>
Date: Tue, 26 Mar 2024 16:19:38 -0700
Message-ID: <CAMFSAReKmon7xAXWq4kJvN4Ge-tKkhUaaDZFP5EZA-=WU5oL1g@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] usb: typec: ucsi: Register cables based on GET_CABLE_PROPERTY
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: neil.armstrong@linaro.org, heikki.krogerus@linux.intel.com, 
	linux-usb@vger.kernel.org, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Bjorn,
posted at https://lore.kernel.org/lkml/20240315171836.343830-2-jthies@google.com/

Thanks,
Jameson
