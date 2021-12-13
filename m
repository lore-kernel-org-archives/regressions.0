Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A7768
	for <regressions@lists.linux.dev>; Mon, 13 Dec 2021 10:02:44 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id u3so29839935lfl.2
        for <regressions@lists.linux.dev>; Mon, 13 Dec 2021 02:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norrbonn-se.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=z9Y+0MQBNJa7E1NUrpMrgnA/65sAH6lltqkX3sabL4Q=;
        b=f89MwTghTJh9xbVPHJdv540k3aXAkGCfcioJ1cQnA5kHN9HtsbIyANxPgCctJx0mV7
         g59KgJAqTfrchFS1X3VGigVI7/Cub26LytiqX54rR+XOvsBMZwUsPG9zzzgujpZc+m9I
         I7S2iL9plaDH1oWB5ifL4Ti6TNj+FWOv9X3axEhWJqsGiC9+Ck/1SvWMdfZm/Ccb8gY1
         3u+41v9b6rAP7bbtleLtZQj+AKktsFlUZntHXgGIfxKBO4bkxWvpNLhGsDZay8ekREn3
         GPNTDuHkZFoEgYVZBzRWLSxLlvDIzghPxbVNLIRn5szpPTDggqF7ANBEz3TuLsD07cpZ
         Zu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=z9Y+0MQBNJa7E1NUrpMrgnA/65sAH6lltqkX3sabL4Q=;
        b=qVdF5ejzqqX9kFiIcxbehmfWiYbhNnTDa4EmG/G8jfNL+bGvMZUGcWV9Pd72YF8uIx
         MMy4/UtJo3kzN9RFOzYlHvcEFaaqvjqYacTEB4Y1g3uDf22h8+LbeYiUgzyU6nC7uTcP
         Khk/lETgGHM0YtVnr5pZtMIpjbqrzO4uzYtKrbJVS/h6LmGVNqTOAfilXgVyJHGH9DD5
         BnTiJQacJ48l5oUAgWOT32CgMCuNb9o6fIHNoXCBH5n+60tLTNaa41gZhuDSz+nLT7qD
         TC1u6DPDiaOjMGQnfR2Qz7ZLH+amDxHfv1vCK0EeviKhI/WEVWlEBbZgtk3b7LsCVsz8
         QL5g==
X-Gm-Message-State: AOAM5339RDk6DDvoDfdNMjcNPPq9NM9czT2w0j41hib+zOB32Ag4CPds
	FgQ3WbU27vvsoZroW0hCkrqNpg==
X-Google-Smtp-Source: ABdhPJyRno5RK5s08wWaHd5Dlbpb6OS4BxDton/NtNfoeLI5iA0SZgJHiOiuiSplmDdwNz5rZ4xZXA==
X-Received: by 2002:ac2:5a48:: with SMTP id r8mr27638822lfn.100.1639389762961;
        Mon, 13 Dec 2021 02:02:42 -0800 (PST)
Received: from [192.168.1.211] (h-81-170-137-65.A159.priv.bahnhof.se. [81.170.137.65])
        by smtp.gmail.com with ESMTPSA id c2sm1394607lfb.270.2021.12.13.02.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 02:02:42 -0800 (PST)
Message-ID: <d406fd08-39d9-42db-f01c-2eccf5b0be00@norrbonn.se>
Date: Mon, 13 Dec 2021 11:02:41 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] usb: gadget: atmel: Revert regression in USB Gadget
 (atmel_usba_udc)
Content-Language: en-US
To: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>,
 regressions@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel@lists.infradead.org,
 Cristian Birsan <cristian.birsan@microchip.com>, linux-usb@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felipe Balbi <balbi@kernel.org>
References: <20211211183650.12183-1-marcelo.jimenez@gmail.com>
From: Jonas Bonn <jonas@norrbonn.se>
In-Reply-To: <20211211183650.12183-1-marcelo.jimenez@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marcelo,

On 11/12/2021 19:36, Marcelo Roberto Jimenez wrote:
> The regression occurs on the second time a self powered gadget is
> connected to the host. In this situation, the gadget no loger accepts
> an address in the USB enumeration phase.
> 
> The regression has been introduced in
> commit 70a7f8be8598 ("usb: gadget: atmel: support USB suspend")
> 
> Signed-off-by: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
> ---
> 
> Hi,
> 
> I have been using an ACME Arietta board (Microchip AT91SAM9G25 MPU, ARM9@400Mhz) for some years, and from time to time I need to do a kernel upgrade to fix issues or introduce new required features.
> 
> I have recently noticed a regression in the ethernet over USB Gadget. The system boots fine and when the device is first connected to a host it is recognized. But upon disconnection, the second time the device is connected to the host, it is no longer recognized. Of course, the gadget is self powered.
> 
> I did a "git bisect" and found that the patch introducing the regression is this:
> 
> commit 70a7f8be85986a3c2ffc7274c41b89552dfe2ad0
> Author: Jonas Bonn <jonas@norrbonn.se>
> Date:   Wed Feb 20 13:20:00 2019 +0100
>      usb: gadget: atmel: support USB suspend
>      This patch adds support for USB suspend to the Atmel UDC.

Given that the patch that you want to revert is almost 3 years old, it's 
a bit of a stretch to call this a regression.  I suspect that a cleaner 
way forward is to introduce some kind of quirk for your board.

I have a self-powered board where the USB suspend sequence works and 
device add/remove works fine.  So fundamentally, I suspect that the 
driver is ok.

With all that said, I'm not immediately in a position to run tests on my 
SAMA5D2 board right now and the kernel on that board is 5.2.  I'm not 
sure when we we would notice that USB suspend stopped working because 
there is no kernel maintenance planned for that board, as far as I know; 
someday, however, that work might happen and the lack of working USB 
suspend will be a regression in and of itself.

Thanks,
Jonas
