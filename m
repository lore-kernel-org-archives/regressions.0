Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA5318B0D
	for <regressions@lists.linux.dev>; Thu,  3 Aug 2023 13:47:11 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-40feecefa84so2546861cf.1
        for <regressions@lists.linux.dev>; Thu, 03 Aug 2023 06:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691070431; x=1691675231;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zseKbfLWs9zIg2+xdp7ES4ETCzu69tRL4V7rUgw0H3Y=;
        b=Sw0639MSAk8jSMAWoUbOCvuuwlprlFFIwILnK8nMJIr7fjke0eE2uzyioICdlB3Wtn
         jmNqo2HuAJVzU64K3aodygWYW/vEZW+89SLFFB8BCrfKkeYvTgSuuPgdmi/NSm5yKW+J
         YYezAwUIL4WDpZsT+8rCP1Vr/fHETBTgKHP5yYj5vpGQbkEjcJ2OFvjIRZSaMNAcMnEd
         aaj4QJSK/rmUqcyxyFrEGfO5E3Y74SZ5sQNSjBE2xZUmtoqUsIUqFb4LIpsrzelHyU4J
         VK6RbxuteeoJtI1OFH7na73lxKicXjlUOmEEmN+sXeSIfZQOfiXdVk7X1lmdXcPaSmVT
         +Snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691070431; x=1691675231;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zseKbfLWs9zIg2+xdp7ES4ETCzu69tRL4V7rUgw0H3Y=;
        b=Mce++l7Rs8EkSu3Hk8lv9DfIN+2iLINQSCBfGG6ztdOqWFZcQQM4Uo+8iWQBsJotDc
         Dvw05LapFG77BruLW4Gqc5YQNZVE+jw10ZabueQoGOnLIyfoOisY9BfLzQhZxxPUnJZE
         Qj85cdmazJlhS1fGm3iH+M1G8mR2XXK7oSx9FdS+xoyLTafaXYVfP0II1GYBqGshwdli
         UXwDanzc/BHMSa4udbmc/6rw+sI+Y3uCq2w36E4G5c/NVYMQv8UrAZJevZfrD6kZklse
         5QBRr23XnVoFSJaOEhxzT/eUGSl/K4VrW/5KJ3eAS7cXrWyCpovVOyUGhlYt1mkh1Shr
         rsXg==
X-Gm-Message-State: ABy/qLaCjtrOWgad70mDnvnqaplyB8OmehDjRkuYlrqWJh5GCSsHeI/b
	pCjWG02hisT7rsgYLJyoYZs2jrX2HvOysrvkc3Y=
X-Google-Smtp-Source: APBJJlEVu7ZrkjGRwma4PuGfEhkoQMx5CRBc2i9iv50Ha9jBrr1GqTbSrH8wUBzxhl9fHJnOqnpELQ==
X-Received: by 2002:a05:622a:1d5:b0:40f:da66:4da with SMTP id t21-20020a05622a01d500b0040fda6604damr7930401qtw.20.1691070430857;
        Thu, 03 Aug 2023 06:47:10 -0700 (PDT)
Received: from ?IPV6:2803:2a00:8:bf18:c5cb:dc8d:dae6:5e27? ([2803:2a00:8:bf18:c5cb:dc8d:dae6:5e27])
        by smtp.gmail.com with ESMTPSA id pa2-20020a05620a830200b00767e1c593acsm5880575qkn.79.2023.08.03.06.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 06:47:10 -0700 (PDT)
Message-ID: <1ff785e1-479e-a822-73dc-cd713a2781c5@gmail.com>
Date: Thu, 3 Aug 2023 09:47:06 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, admin@linuxmint.com, root@linuxmint.com
From: Misty Plianca <thepalpatinelives@gmail.com>
Subject: YouTube Broken Since Last Update(s)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Since installing the latest updates for Linux Mint yesterday or this 
morning, YouTube is acting super goofy via Brave Browser. I cannot 
search for anything at all. Nothing happens. Secondly, it is 
occasionally reporting that it is disconnected from the internet and to 
try again. Firefox works fine, however. I reported the issue to Brave, 
and have now communicated this with you to be certain everyone is aware.

I have some other stuff to discuss with you when you are available. I 
have information that you may find helpful and disturbing regarding 
Linux security. If you would like to discuss this, please reply.

My System:

Kernel: 5.4.0-155-generic x86_64 bits: 64 compiler: gcc v: 9.4.0
Desktop: Cinnamon 5.2.7 wm: muffin dm: LightDM Distro: Linux Mint 20.3 Una
base: Ubuntu 20.04 focal


Regards,

Misty Plianca

