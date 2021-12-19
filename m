Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2430173
	for <regressions@lists.linux.dev>; Sun, 19 Dec 2021 13:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639921992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6y4s59fRDhRXZ+MFWbqd48C+ut3PapB8I0wNJafkmy8=;
	b=Dh6A97MN4jEPXiJoa7bWXbaDTJ5cX6mQjOpJqc5c+N3fL3Kk3sgurLrHiFAZJYqWkyKvI1
	zZ5rrsBwDX4pZf8yUFJbndIcUZ38hYOcpbNMnC7gMtMapgNZ8JVPAVGFoB8E/Py+E2xzD+
	RBZFIsLJ8CPTxZqtJHGFm7O0p/SpzH0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588--cG8avzyMRed3EbO7a0arQ-1; Sun, 19 Dec 2021 08:53:11 -0500
X-MC-Unique: -cG8avzyMRed3EbO7a0arQ-1
Received: by mail-wr1-f72.google.com with SMTP id x20-20020adfbb54000000b001a0d044e20fso2599159wrg.11
        for <regressions@lists.linux.dev>; Sun, 19 Dec 2021 05:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6y4s59fRDhRXZ+MFWbqd48C+ut3PapB8I0wNJafkmy8=;
        b=bNTuxOM6FdgAsCwAo6dE7J2YPu/bA8WNZtA9FB0iRpnIENCXHWsQil/gP++RJw80Tk
         93UgO9dt8QAzunnM+cdGlbSdPHwpxP25Z9o+CaiP/VAiDT/UkrA30g8hDNyo//HeaeEL
         5QsYuESoZpOnRyNwlqlLnHXCuVY4NW2+vH446DYqAAtaIJfMESnz1Pc6lGZywB72srwD
         uDLdR6N6b3m2EQBEvxrGuI4CqFUdvbq/jTbAqrYf7sCf3QG9t/WweQnMA37tPTRDw6eR
         cqnBg5cc1u6YmVDhQGazInsXw0AFiYNpcDgMjwu8WI2LZTihDZX3FjmwVnsylFsjCJ7Z
         f5mQ==
X-Gm-Message-State: AOAM5331esAXwcTb2B7adhVXiv3exgGRXM3FpphD+1nYBrySSc5UtCKH
	cNkhzjF5Oiifj1WsLnS9b6fcsWSKoulKkfQxFS7zeh4ifZNGEKc+byDV9TtM/vX+BGz3nn6PHso
	iZRdD9ufvXRKK233ki1Q2ojk=
X-Received: by 2002:adf:9004:: with SMTP id h4mr9692862wrh.593.1639921990366;
        Sun, 19 Dec 2021 05:53:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyypGLj1tKxFj+LSvvFpiaauxTLO+snS8pEJl5hCgc9MrMvK2mCfttd2iYEcvhftK55oUc5Fw==
X-Received: by 2002:adf:9004:: with SMTP id h4mr9692849wrh.593.1639921990179;
        Sun, 19 Dec 2021 05:53:10 -0800 (PST)
Received: from [192.168.10.118] ([93.56.170.41])
        by smtp.googlemail.com with ESMTPSA id w17sm14564116wmc.14.2021.12.19.05.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Dec 2021 05:53:09 -0800 (PST)
Message-ID: <54749944-d33d-8364-ad17-6297abf883f5@redhat.com>
Date: Sun, 19 Dec 2021 14:49:52 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [regression] kvm: Kernel OOPS in vmx.c when starting a kvm VM
 since v5.15.7
To: Thorsten Leemhuis <regressions@leemhuis.info>, kvm@vger.kernel.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: doc@lame.org
References: <f1ea22d3-cff8-406a-ad6a-cb8e0124a9b4@leemhuis.info>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <f1ea22d3-cff8-406a-ad6a-cb8e0124a9b4@leemhuis.info>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/21 06:01, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> TWIMC, I stumbled on a bug report from George Shearer about a KVM
> problem I couldn't find any further discussions about, that's why I'm
> forwarding it manually here.
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=215351
> 
> George, BTW: if reverting the change you suspect doesn't help, please
> consider doing a bisection to find the culprit.

This should be fixed by commit e90e51d5f01d.  I'll send it to 
stable@vger.kernel.org.

Thanks,

Paolo

