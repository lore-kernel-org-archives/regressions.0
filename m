Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC263D7D9F
	for <regressions@lists.linux.dev>; Wed, 26 Aug 2026 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747741; cv=none; b=MGJQXWG0/oYJdPDVngyVVvWgCsoIY4pgYGk9Mv8ddL+Z5BOnqMy3H26QoscCR3sPEZblPT7fWkALYPwJN1U+qLgV8AcFlhsepq2pUYKPQnRDoYKqYETUVRDQAXDkexpn6mmMeOd6JGNxMCL5Z0X9f8irc0eUhxpUYbj1KXm2jrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747741; c=relaxed/simple;
	bh=VjrLxq41uw4BiWdFbGzXauFX3ga0sq0gdX7yYyoSq50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sG++9s7QWLdFwnCxqMBlXRBhybXy8b8g2Zonw+sxjusi9YQUsZCFJYm9XNYGVB2a5lFjnoMFem8JBrqwFhjWgS6yot+xzSYn6HO1KBGtieWdj+iK0EZKtvTPaPLzrStnqbs7imnP4yI5af7mszA7CC+kOVgR90VKI0CthqbyAZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IshmTjrL; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IshmTjrL"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-448b0ff4a57so1156882fac.2
        for <regressions@lists.linux.dev>; Wed, 26 Aug 2026 05:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747739; x=1788352539; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VjrLxq41uw4BiWdFbGzXauFX3ga0sq0gdX7yYyoSq50=;
        b=IshmTjrLxaqpcElRPr5B3es/20T5Cf3V+hUjpYzeQdMZlOIA6DnjskZMJuB0dxAy6u
         QoTHPFRStzQRRyhioiCkvwvLkz42EKGAgwAA++wrCaUKI9RxhtJG1dC2QvLktdVLPzR7
         g3sINJvmxB43Fj5BcgrtquCxWhCH+5e9EckXF98foBIJT+DP6g0RlHhUkev441o6YWe3
         Q9P92Ddt+AEtQ1ff5tCrbU779gcJN12WZoj/WYjZnemiG9F+SX6K+D9MNZ9OU8UH9BVj
         NRcQEyOsxh6Aw53iserCGma1uprd/lXs+cP1npEWbJj8iOZP8CxHFC6aa639MsqsJLx7
         znfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747739; x=1788352539;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjrLxq41uw4BiWdFbGzXauFX3ga0sq0gdX7yYyoSq50=;
        b=EGnG2YQj2vHghTIkzBl/i/uhvkGiuawDZ37UlSNYNIKtF433Qt9j+kUhlFCOec0Utu
         dmxZJC1ha+WZkkPi9R2hosk4g7wkNUwFEOZ5Ycpac/A/aa5ZMwq46GDqrrEgrrUsnyKr
         SEQ7y8oleJ8daBcuZGU3FGTtHFAn7SQtG4fSvt5rWnDh6IuNaehpV6BWyRQXaIWor9Yo
         I4hpR3qHGKbfgbPBGkP+BDC7LO/TMEjXU19qpUNXcR80KARx5lPE+FCQiNR4UHEDnmfP
         GnsPSvWQlaUZu7BBgxWVWIzK7ileaajGmdMeXIlRsnTQhyA4s8cgbJP5eSXUscIaJCY1
         u6rQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/Zhu+tEfJTi4t7GWM4V0fKzZTCvaSDx0HLNy0/HH7H30BsSATr4S6urKs1xbgLPz5KG3j790bp10YyA==@lists.linux.dev
X-Gm-Message-State: AFuF++mng1cAjTrLy2CJBN/N7HH7YAhEkFACBw2+r7O2hL4VLi0ewwxC
	NnkSQif84G9H5Zta+pfjfzeTnM/1yh0y+XqvNTXckQW+r2j+yNs+A4FD
X-Gm-Gg: AR+sD13nJ/OEE4cDK8QzyPStn+bwWfhwBLwGTDT52iKenvXfnF+cEXHoEWjeZMjL7OG
	OZ4t6vujP1LhGYNPxjv4D/fy7sXMUC3gJyJq7lSWG6vLmBWk710DIJakTk75V6HRGbXhPjOm76Y
	0Opw9rPLqjzd8ei3K4n5G+3KKWx1TrdtLcq5uvMOos01pVYoccLeO4KihVG73Yi83szyu6g8Q4f
	3MEmb4t9dW+HTx+WzWDVkCcLu+TumP9R58xQP4XV3zUec5lSR2kqVZlNIAwiHwA1jM1YVtgqsnY
	SowGzOy/WasQncH7KK3hisC4dIJkWqjPb+v8AQChLRni6+7z2qK+BwbmRZMyLhdkFNTQeKjiKdK
	39RgIzSrFMk12gA6VN77/pFVdOnzHCKcr0+K9zvJJaWsTIo2WZriac7DMb8PoNRzrpaEO1loq2I
	3D6UrP5r2be2cA4I6Bv1Fay2uyuGB7P7ambXwRbr1RF5SI4Bd/hU8qqCCe61UNwwQ19ncNYpXth
	DB2Eqp5pySSK0JMfHj8xX80yL/IvQ==
X-Received: by 2002:a4a:ee0e:0:b0:6b0:4170:59ae with SMTP id 006d021491bc7-6b1a04ffdd4mr5407369eaf.27.1787747738713;
        Wed, 26 Aug 2026 05:35:38 -0700 (PDT)
Received: from localhost ([2409:40c4:3158:4e86:efde:1f4:fc9e:35b6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eefd98sm14998290c88.3.2026.08.26.05.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:35:37 -0700 (PDT)
Date: Wed, 26 Aug 2026 18:05:34 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Mathias Nyman <mathias.nyman@linux.intel.com>, 
	linux-usb@vger.kernel.org, regressions@lists.linux.dev, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
	Forest <forestix@gaga.casa>, Slavik Dev <developer.slavik@gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
Message-ID: <ao7aLXk9q_v_jEyX@eggarch>
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
 <CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
 <CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
 <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info>
 <aosGtkE_diwVJJtB@eggarch>
 <20260823174059.46fec036.michal.pecio@gmail.com>
 <aoser8dLytrwqBC2@eggarch>
 <CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com>
 <ao1ovvdPAy6n_F7I@eggarch>
 <CAPyJwA-QALkCQn8J1+=U-nuE_7WSEPhVcUEKb+MMYMaA_1AVjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPyJwA-QALkCQn8J1+=U-nuE_7WSEPhVcUEKb+MMYMaA_1AVjQ@mail.gmail.com>

On Tue, Aug 25, 2026 at 11:43:22PM +0200, Mathieu Fluhr wrote:
> The patch you sent makes the issue go away. I am now running the exact same
> scenario for 2 hours, without any crash.
That's good, thanks for confirming.

> However, I am not sure if this can qualify for a proper fix, since I
> do not have any
> external hub connected to my motherboard: All my USB devices are directly
> plugged into root hubs (and at the moment, there is only a keyboard and a
> mouse).
Yeah that's the point it only skips the 200ms hold for root hubs. The
external hubs still get their fair hold since a parent exists for them.
So external hubs are completely unaffected by this patch.

On 'proper fix', I think it is, even if we keep this bug seperate for a
moment, it makes sense to not give root hubs hold they don't need.

I'd love to hear more thoughts on the patch.

Regards,
Lovekesh
