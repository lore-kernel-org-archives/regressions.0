Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4233F7E
	for <regressions@lists.linux.dev>; Sat,  4 Mar 2023 15:41:36 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id l1so4867755wry.12
        for <regressions@lists.linux.dev>; Sat, 04 Mar 2023 07:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677944494;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5pvyLmp5wyo64q2XeD5TY4V9njcMxpvio2c4JP2y1r8=;
        b=qQiSG6IZRKz+oc1bByCIGQf/ISZXbcYmaUiAVsc8BohFTQim2j50EW7qCELChYXJ6+
         9Q9ml7Y8whY9aRSGgRHJvLfn/s+qNG+jAwOn4aF+iZCeLINRc4MiCuiSKanuroWqDZHq
         notX+H4jj7hTsMtZY/1D9TzH2Jj+aijpwdrzn8mOZ7p+bGmMtFD13a5Sh5O5dyAxEZAW
         UbC4oh2jSmfRzSxafCki06VxUoB/I4++dkdh3tLFwxthG4O3m9ALrGtyeiQs95ifsH/q
         R111gr5oTL2idkuoz9gEn+TNFOSd3Y9o316MALlvy7NBLj4PVK/wCAGxPFyU1OCXWCK3
         J6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677944494;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5pvyLmp5wyo64q2XeD5TY4V9njcMxpvio2c4JP2y1r8=;
        b=wu9c8iHkYufp0lT2YzKw1SCFYvruOOWskuNe3Nhp5NYcDt5XgjbY2MVAarXeiHXfoA
         5lDMDW5ACFQu7xU7X2MDCTtpFgJy1BbR4N+NdQUrQmV4Hz8MLnUAiFyTfzlU4CDxkYxF
         PXA2Yb0inph9BDJadeyYIt4IywYFyyNyH5RP1HKYk7BNVvXYIBJi0FylGQdJyuTzKBES
         iNw7Ugzd6xW02F06cSvM1Wmybt+DZS3Kg/ewowvlJeFIgrpGpeJdQUKNAcm6a1y6S0Bm
         vcIanmcxZF/sPHao2k5IEV0r+g6MndeKVrNzuv1+BcLxWqWF0FRqcAexC4OUedZXUGR4
         r7yA==
X-Gm-Message-State: AO0yUKUJBdN53k21crBaUBIe+W/J0+61whCYNXmEFcApU9G1k9iNuWms
	X+CaJQUhtpEiOqnNZHX5X/h1VrwAO/SGLTYZ9uxABod3Aic=
X-Google-Smtp-Source: AK7set+woUmTJnDkC9bA0VZazT8nzcCOOh1GVLmH6mzkjuzjS3dBDw4/gqlTCggY7F+dLlij98D1BJRDH1AwzddF82o=
X-Received: by 2002:a5d:4805:0:b0:2c9:8df7:b385 with SMTP id
 l5-20020a5d4805000000b002c98df7b385mr1210068wrq.1.1677944494302; Sat, 04 Mar
 2023 07:41:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Laurent Lyaudet <laurent.lyaudet@gmail.com>
Date: Sat, 4 Mar 2023 16:41:23 +0100
Message-ID: <CAB1LBmv1kY+kuUBWvXRoe+mbQBjtJOFvZB8Smmbcuy2MdvgJnA@mail.gmail.com>
Subject: Too many BDL entries regression
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

Thanks for your hard work :)
Ubuntu 22.10 shipped kernel 5.19.0-35 thursday.
And some people started having syslogs :
"Too many BDL entries"
https://askubuntu.com/questions/1457367/snd-hda-intel-0000001f-3-too-many-bdl-entries-messages-in-system-log

I looked here how to report it :
https://docs.kernel.org/admin-guide/reporting-issues.html
and searched for "Too many BDL entries" but found nothing

I looked at versions here :
https://kernel.org/
but I don't know if version 5.19 should be reported at
stable@vger.kernel.org
since it is in between
5.15.98
and 6.1.15
or maybe Ubuntu does some renumbering ?

Excuse me if my report does not contain all needed data,
or should be addressed elsewhere.
Sorry if I cannot do all the checks with latest kernel ;
my current laptop is my only PC for work,
and I would prefer to avoid breaking it, even for a day or two.

Nevertheless, I would be happy to provide log extracts or other
information that may help.

Have a nice week-end, best regards,
    Laurent Lyaudet
