Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC59EA0
	for <regressions@lists.linux.dev>; Tue, 25 Jul 2023 00:00:53 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3a3790a0a48so3683439b6e.1
        for <regressions@lists.linux.dev>; Mon, 24 Jul 2023 17:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690243252; x=1690848052;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WOzXYCn1+7xPbIOwobza0NrL0Zs8lbOw99BO/5o3zM=;
        b=KVq0Tw3a2zJLCFcVcNC2Z4bBSnqV70bHamHgXDIgDthhxomKgjuObTS1Gw4IpuReKn
         lIwFDxCv3QNCIxoM4JaAOzzPILbYsVpczodgEdqzH29iyK01iP5rxckgGA8h7uuRbw+9
         M2Cocrec8sXG6ZF6oTT1GpYQpLW5t+UPdfzyC7nVsvq+0t02MLKtOAHuLBtETVsRWvOb
         H0gNAYOqwG+ZTiZesNV0KVxbEcVFqKwHO4M1mmeRvZpKbAgzaXziGZaqB4AEuNp+A2Nk
         pV357GxoWNtJf35LDWlT6eczEEtbZrL5NsijpUJPrbyCWk3KX9ifWPZjjBsgCRn6j0EJ
         /niA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690243252; x=1690848052;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/WOzXYCn1+7xPbIOwobza0NrL0Zs8lbOw99BO/5o3zM=;
        b=SQSCOb9W0sXvN8414BBREGc89RrSgxmlJpfsdVNXkOJLfXuIcureylmUXE76nzhofR
         30bz/m4TMzjjf99JjCLeiXEtl32wLDyp3a2s6ib1ZnaUg6Ugduihk49BaNCG830WwQBe
         KKNz6P/556lxjF5nW/Gq2M58MpKPxIJfkiPZcfw+6H457nf1w1j6KZDbmCn6mTow0ANp
         my/8ZLR4pdMed2Wm7m1tuIHrC53UvxMX1B3NtJfJ0TlvkYbwkYYIrfqhrBw6BYMT7hDI
         +nWF1KZeP8NreCCxoa+0eixbMn/6YYuuI7Or5iNFjKi7Rtypm8C3RF5IW77nCLFbe4wP
         grhw==
X-Gm-Message-State: ABy/qLZbZCNbI8w3lkTO8kKdlmkMecQMIzHLQ5X1jS1eZYBVI3DGPNBo
	CHISc3fg03/QRR3tta/+kxY=
X-Google-Smtp-Source: APBJJlG6H3RZJ9aETzUQ7uF2B6MJ9YNE/LiDWvnOpOP9zP/cT/QTvEaNVN533DBtJXAlzzDKP+h4oQ==
X-Received: by 2002:a05:6808:10c7:b0:3a1:eccc:26da with SMTP id s7-20020a05680810c700b003a1eccc26damr15126212ois.25.1690243252376;
        Mon, 24 Jul 2023 17:00:52 -0700 (PDT)
Received: from [192.168.0.104] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id bb11-20020a170902bc8b00b001b03b7f8adfsm9481776plb.246.2023.07.24.17.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 17:00:52 -0700 (PDT)
Message-ID: <42bc8e02-5ee0-f1c8-610e-e16391e54ee2@gmail.com>
Date: Tue, 25 Jul 2023 07:00:21 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Henrik Rydberg <rydberg@bitmath.org>,
 Verot <verot.wrongdoer713@simplelogin.com>
Cc: Linux Input Devices <linux-input@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Stable <stable@vger.kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Kernel 6.4.4 breaks Elan Touchpad 1206
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Description:
> When booting into Linux 6.4.4, system no longer recognizes touchpad input (confirmed with xinput). On the lts release, 6.1.39, the input is still recognized.
> 
> Additional info:
> * package version(s): Linux 6.4.4, 6.1.39
> * Device: ELAN1206:00 04F3:30F1 Touchpad
> 
> Steps to reproduce:
> - Install 6.4.4 with Elan Touchpad 1206
> - Reboot
> 
> The issue might be related to bisected commit id: 7b63a88bb62ba2ddf5fcd956be85fe46624628b9
> This is the only recent commit related to Elantech drivers I've noticed that may have broken the input.

See Bugzilla for the full thread:

To the reporter (Verot): Can you attach dmesg and lspci output?

Anyway, I'm adding this regression to be tracked by regzbot:

#regzbot introduced: 7b63a88bb62ba2 https://bugzilla.kernel.org/show_bug.cgi?id=217701
#regzbot title: OOB protocol access fix breaks Elan Touchpad 1206

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217701

-- 
An old man doll... just what I always wanted! - Clara
